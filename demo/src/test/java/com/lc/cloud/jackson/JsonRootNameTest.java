package com.lc.cloud.jackson;

import java.io.IOException;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonRootName;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.Data;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class JsonRootNameTest {

    /**
     * \@JsonRootName 作用是定义一个根 key
     * {key:{json}}
     * 序列化必须设置 objectMapper.enable(SerializationFeature.WRAP_ROOT_VALUE);
     * 反序列也必须设置  objectMapper.enable(DeserializationFeature.UNWRAP_ROOT_VALUE);
     */
    @Test(expected = Exception.class)
    public void test() throws IOException {
        RootNameEntity entity = new RootNameEntity();
        entity.setUserName("lc");
        entity.setAge(1);

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.WRAP_ROOT_VALUE);

        String json = objectMapper.writeValueAsString(entity);
        //结果集会包含在 key 中
        System.out.println(json);
        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.has("sub"));
        //这里没有设置反序列化，则泡醋异常，使用 @Test(expected = Exception.class) 测试期待的异常
        objectMapper.readValue(json, RootNameEntity.class);

        objectMapper.enable(DeserializationFeature.UNWRAP_ROOT_VALUE);
        RootNameEntity expected = objectMapper.readValue(json, RootNameEntity.class);
        Assert.assertEquals(entity, expected);

    }

    @Test
    public void test2() throws IOException {
        RootNameEntity entity = new RootNameEntity();
        entity.setUserName("lc");
        entity.setAge(1);

        RootNameParentEntity rootNameParentEntity = new RootNameParentEntity();
        rootNameParentEntity.setDate(new Date());
        rootNameParentEntity.setRootNameEntity(entity);

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.WRAP_ROOT_VALUE);

        String json = objectMapper.writeValueAsString(rootNameParentEntity);
        //结果集会包含在 key 中
        System.out.println(json);
        JsonNode node = objectMapper.readTree(json);
        Assert.assertFalse("当@JsonRootName类作为属性在其他类中存在，则会被忽略", node.has("sub"));

        Assert.assertTrue(node.has("root"));

        objectMapper.enable(DeserializationFeature.UNWRAP_ROOT_VALUE);
        objectMapper.readValue(json, RootNameParentEntity.class);

    }


    @JsonRootName("sub")
    @Data
    private static class RootNameEntity {

        private String userName;

        private Integer age;
    }

    @JsonRootName("root")
    @Data
    private static class RootNameParentEntity {

        private RootNameEntity rootNameEntity;

        private Date date;
    }

}
