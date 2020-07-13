package com.lc.cloud.jackson.entity;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;

public class BaseRspDeserializer extends JsonDeserializer<BaseRsp<?>> {

	/**
	 * 序列化时解析被包装类存在 指定@CusterJacksonName 注解，则使用 value 作为属性值，否则使用类名首字母小写
	 * 反系列化则需要根据序列化的属性来指定到类
	 *{
	 * 	"code": 1,
	 * 	"msg": null,
	 * 	"userInfo": {
	 * 		"username": "11",
	 * 		"password": "22"
	 *        }
	 * }
	 * @param jp
	 * @param deserializationContext
	 * @return
	 * @throws IOException
	 * @throws JsonProcessingException
	 */
	@Override
	public BaseRsp<?> deserialize(JsonParser jp, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {

		BaseRsp<?> rsp = new BaseRsp<>();

		JsonNode node = jp.getCodec().readTree(jp);
		int code = node.get("code").numberValue().intValue();
		String msg = node.get("msg").asText();





		return null;
	}
}
