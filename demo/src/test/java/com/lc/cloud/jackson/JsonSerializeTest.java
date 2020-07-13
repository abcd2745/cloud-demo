package com.lc.cloud.jackson;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.io.IOException;

/**
 * 自定义Jackson序列化和反序列化
 * 复杂类自定义序列化和反序列化很累。。
 */
@RunWith(JUnit4.class)
public class JsonSerializeTest {

    @Test
    public void testSerialize() throws IOException {
        JsonSerializeEntity entity = new JsonSerializeEntity();
        entity.setAge(1);
        entity.setUserName("lc");

        ObjectMapper objectMapper = new ObjectMapper();

        String json = objectMapper.writeValueAsString(entity);
        System.out.println(json);

        JsonNode node = objectMapper.readTree(json);
        Assert.assertTrue(node.has("id"));
        Assert.assertTrue(node.has("itemName"));
    }

    @Test
    public void testDeSerialize() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        String json = "{\"age\":1,\"userName\":\"lc\"}";
        JsonSerializeEntity jse = objectMapper.readValue(json, JsonSerializeEntity.class);
        Assert.assertEquals("1", jse.getAge() + "");
        Assert.assertEquals("lc", jse.getUserName());
    }

    @Data
    @JsonSerialize(using = UserSerializer.class)
    @JsonDeserialize(using = UserDeserializer.class)
    private static class JsonSerializeEntity {
        private String userName;
        private Integer age;
    }

    /**
     * 自定义序列化方法
     */
    private static class UserSerializer extends JsonSerializer<JsonSerializeEntity> {

        @Override
        public void serialize(JsonSerializeEntity value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
            gen.writeStartObject();
            gen.writeNumberField("id", value.getAge());
            gen.writeStringField("itemName", value.getUserName());
            gen.writeEndObject();
        }
    }

    /**
     * 自定义反序列化方法
     */
    private static class UserDeserializer extends JsonDeserializer<JsonSerializeEntity> {

        @Override
        public JsonSerializeEntity deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            JsonNode node = jp.getCodec().readTree(jp);
            int id = node.get("age").numberValue().intValue();
            String itemName = node.get("userName").asText();
            JsonSerializeEntity jse = new JsonSerializeEntity();
            jse.setUserName(itemName);
            jse.setAge(id);
            return jse;
        }
    }

}
