package com.lc.cloud.jackson;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static org.hamcrest.CoreMatchers.is;

public class JsonNodeTest extends JacksonDemoTest {

    @Test
    public void jsonNodeArrayTest() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        List<Product> productList = productList(2);

        String json = objectMapper.writeValueAsString(productList);

        JsonNode jsonNode = objectMapper.readTree(json);

        Assert.assertTrue(jsonNode.isArray());
        //通过 size()方法获取数组大小
        Assert.assertEquals(2, jsonNode.size());
        //通过get()方法遍历数组
        for (int i = 0; i < jsonNode.size(); i++) {
            JsonNode productNode = jsonNode.get(i);
            Iterator<Map.Entry<String, JsonNode>> fields = productNode.fields();
            Assert.assertNotNull(fields);

            fields.forEachRemaining(entry -> {
                JsonNode entryNode = entry.getValue();
                //isValueNode() 判断是否终端值节点
                if (entryNode.isValueNode()) {
                    //判断当前页子节点值是否int类型（Integer)
                    if (entryNode.isInt()) {
                        //只有age 是 Integer
                        Assert.assertThat("age", is(entry.getKey()));
                    }

                    //不知道的类型
                    if(entryNode.isPojo()){
                        System.out.println(entry.getKey());
                    }

                    if(entryNode.isObject()){
                        System.out.println(entry.getKey());
                    }
                }
            });
        }
    }
}
