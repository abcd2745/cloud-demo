package com.lc.cloud.jackson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;

import java.util.*;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.test.util.JsonPathExpectationsHelper;

import java.io.IOException;

@RunWith(JUnit4.class)
public class JacksonDemoTest {

    private static ObjectMapper objectMapper;

    @Test
    public void jsonPathTest() throws ParseException {
        JsonPathExpectationsHelper json = new JsonPathExpectationsHelper("$.message");
        json.assertValue("{\"message\":true}",false);
    }

    @BeforeClass
    public static void setUpClass() throws IOException {
        objectMapper = new ObjectMapper();
    }

    /**
     * Jackson 树遍历
     */
    @Test
    public void test() throws IOException {
        String json = "{\"userName\":\"lican\",\"password\":\"123\"}";
        JsonNode jsonNode = objectMapper.readTree(json);

        String name = jsonNode.get("userName").asText();
        Assert.assertEquals("lican", name);
    }

    @Test
    public void test2() throws IOException {
        Product product = buildProduct();
        //id 未参与序列化，设置为null就不会显示在json中
        product.setId(null);
        String json = objectMapper.writeValueAsString(product);
        //简单的对象序列化使用 readValue(json,JavaType),复杂的使用new TypeReference<NEED> @see test3
        Product expected = objectMapper.readValue(json, Product.class);
        //assertEquals 用的是 比较地址，这里用toString，比较值
        Assert.assertEquals(product.toString(), expected.toString());

    }

    @Test
    public void test3() throws IOException {
        List<Product> products = productList(5);
        //序列化
        String json = objectMapper.writeValueAsString(products);
        //验证JsonFormat
        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.isArray());
        JsonNode productNode = node.get(0);
        String date = productNode.findValue("date").asText();
        //日期格式 --- yyyy-MM-dd HH:mm:ss
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //如果抛出异常，说明日期格式不是yyyy-MM-dd HH:mm:ss
            df.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        System.out.println(json);
        //反序列化  （复杂对象使用  TypeReference）
        List<Product> parseList = objectMapper.readValue(json, new TypeReference<List<Product>>() {
        });

        Product product = parseList.get(0);

        Assert.assertNotNull(parseList);
        Assert.assertNull(product.getId());
        Assert.assertEquals(5, parseList.size());
        Assert.assertNull(product.getDefaultBoolean());
        Assert.assertFalse(product.isBooleanValue());
    }

    protected Product buildProduct() {

        Random random = new Random();

        Product product = new Product();
        product.setId(System.currentTimeMillis());
        product.setName("product name");
        product.setAge(1);
        product.setDate(new Date());

        List<Goods> goodsList = new ArrayList<>();

        int size = random.nextInt(5) + 1;
        for (int i = 0; i < size; i++) {
            Goods goods = new Goods();
            goods.setPrice(BigDecimal.valueOf(random.nextDouble()));
            goods.setCount(i);
            goods.setGoodsName("goods name");
            goods.setList(Arrays.asList("a" + i, "b" + i, "c" + i, "d" + i));
            Map<String, String> map = new HashMap<>();
            map.put("key-" + i, "value-" + i);
            goods.setMap(map);
            goodsList.add(goods);
        }

        Map<String, Goods> goodsMap = new HashMap<>();
        goodsMap.put("product" + size, goodsList.get(0));

        product.setGoodsMap(goodsMap);
        product.setGoodsList(goodsList);
        return product;
    }

    protected List<Product> productList(int size) {
        List<Product> productList = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            Product product = buildProduct();
            productList.add(product);
        }
        return productList;
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Product {

        @JsonIgnore
        private Long id;

        private String name;

        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private Date date;

        /**
         * 默认是null
         */
        private Boolean defaultBoolean;

        /**
         * 默认false
         */
        private boolean booleanValue;

        private Integer age;

        private Map<String, Goods> goodsMap;

        private List<Goods> goodsList;

    }

    @Data
    private static class Goods {

        private String goodsName;

        private BigDecimal price;

        private Integer count;

        private Map<String, String> map;

        @JsonProperty("goodsList")
        private List<String> list;

    }
}
