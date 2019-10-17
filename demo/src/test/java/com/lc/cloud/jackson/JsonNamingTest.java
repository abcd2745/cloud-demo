package com.lc.cloud.jackson;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.io.IOException;

/**
 * json 命名转换
 * 1.通过@JsonNaming 注解定义独立类的统一转换规范
 * 2.通过ObjectMapper设置类的统一转换规范
 * 3.通过@JsonProperty 定义类独立属性的转换
 * 自定义命名策略，可继承自： PropertyNamingStrategy.PropertyNamingStrategyBase ，也可也直接继承PropertyNamingStrategy类
 */
@RunWith(JUnit4.class)
public class JsonNamingTest {

    @Test
    public void testNormalEntity() throws IOException {
        NoJsonNamingEntity entity = new NoJsonNamingEntity();
        entity.setPassword("123");
        entity.setUserAge(1);
        entity.setUserName("lc");

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(entity);

        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue("普通类根据类属性设置json字段", node.has("userName"));
        Assert.assertTrue("普通类根据类属性设置json字段", node.has("password"));
        Assert.assertTrue("普通类根据类属性设置json字段", node.has("userAge"));
    }

    /**
     * 在实体类上使用 @JsonNaming注解
     *
     * @throws JsonProcessingException
     */
    @Test
    public void testJsonNamingAnnotation() throws IOException {
        JsonNamingEntity entity = new JsonNamingEntity();
        entity.setPassword("123");
        entity.setUserAge(1);
        entity.setUserName("lc");

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(entity);
        System.out.println(json);

        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.has("user_name"));
        Assert.assertTrue(node.has("password"));
        Assert.assertTrue(node.has("user_age"));

        JsonNamingEntity expected = objectMapper.readValue(json, JsonNamingEntity.class);

        Assert.assertEquals("通过@JsonNaming注解定义类转换规则", entity, expected);
    }

    @Rule
    public ExpectedException expectedEx = ExpectedException.none();

    /**
     * 使用全局配置ObjectMapper
     *
     * @throws IOException
     */
    @Test
    public void testObjectMapperNamingStrategy() throws IOException {
        NoJsonNamingEntity entity = new NoJsonNamingEntity();
        entity.setPassword("123");
        entity.setUserAge(1);
        entity.setUserName("lc");

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setPropertyNamingStrategy(new CustomJsonNamingStrategy());
        String json = objectMapper.writeValueAsString(entity);
        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.has("UserName"));
        Assert.assertTrue(node.has("Password"));
        Assert.assertTrue(node.has("UserAge"));

        NoJsonNamingEntity expected = objectMapper.readValue(json, NoJsonNamingEntity.class);

        Assert.assertEquals("通过ObjectMapper设置命名策略定义类转换规则", entity, expected);
    }

    @Test
    public void testJsonProperty() throws IOException {
        JsonPropertyEntity entity = new JsonPropertyEntity();
        entity.setPassword("123");
        entity.setUserAge(1);
        entity.setUserName("lc");
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(entity);
        System.out.println(json);

        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.has("user_namE"));
        Assert.assertTrue(node.has("password"));
        Assert.assertTrue(node.has("userAge"));

        JsonPropertyEntity expected = objectMapper.readValue(json, JsonPropertyEntity.class);

        Assert.assertEquals("通过JsonProperty注解定义类属性转化", entity, expected);
    }


    /**
     * \@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
     * - https://www.cnblogs.com/majianming/p/8491020.html
     * \@JsonProperty("OPER_TYPE") 一个个加
     * spring.jackson.property-naming-strategy=SNAKE_CASE 统一配置
     * \@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class) 只有一个类要这样
     * \@JsonNaming(SkyArkPropertyNamingStrategy.class) 只有一个类并且特殊的转换
     * \@JsonInclude(Include.NON_NULL) 这个注解放在类头上就可以解决。 实体类与json互转的时候 属性值为null的不参与序列化
     * https://www.cnblogs.com/-xuzhankun/p/8034179.html
     * <B>定义命名转换规范</B>
     */
    @Data
    @JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
    private static class JsonNamingEntity {

        private String userName;

        private String password;

        private Integer userAge;
    }

    @Data
    private static class NoJsonNamingEntity {

        private String userName;

        private String password;

        private Integer userAge;
    }

    @Data
    private static class JsonPropertyEntity {

        @JsonProperty("user_namE")
        private String userName;

        private String password;

        private Integer userAge;
    }

    /**
     * 自定义的命名规范策略
     * 将首字母大写
     */
    public static class CustomJsonNamingStrategy extends PropertyNamingStrategy.PropertyNamingStrategyBase {

        /**
         * 转换
         *
         * @param input 类的字段
         * @return json的key
         */
        @Override
        public String translate(String input) {
            if (input == null) {
                // garbage in, garbage out
                return null;
            }

            return input.substring(0, 1).toUpperCase() + input.substring(1);
        }
    }


}
