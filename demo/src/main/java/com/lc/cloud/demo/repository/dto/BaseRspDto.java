package com.lc.cloud.demo.repository.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * 响应类
 *
 * @param <T>
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class BaseRspDto<T> implements Serializable {

    private static final Long id = 1L;

    private T data;

    private String code;

    private String errMsg;

    public static BaseRspDto success() {
        return new SuccessRsp();
    }

    private static class SuccessRsp<T> extends BaseRspDto<T> {

        private static final String successCode = "1";

        public SuccessRsp() {
            this.setCode(successCode);
        }
    }

}
