package com.lc.cloud.jackson.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonDeserialize(using = BaseRspDeserializer.class)
public class BaseRsp<T> {

	private int code;

	private String msg;

	private T data;
}
