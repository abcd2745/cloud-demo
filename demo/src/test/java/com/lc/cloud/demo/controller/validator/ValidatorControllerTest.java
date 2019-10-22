package com.lc.cloud.demo.controller.validator;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.equalTo;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ValidatorControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    public void validPathVariable() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/valid/123.json").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("123")));
    }

    /**
     * 请求url验证失败，抛出ConstraintViolationException异常
     * 通过统一异常处理，转换成json对象返回
     * <p>
     * andDo添加执行结果处理器，表示要对结果做点什么
     *
     * @throws Exception
     */
    @Test
    public void validPathVariableValueError() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/valid/1234567.json").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print())
                .andDo(mvcResult -> {
                    ObjectMapper objectMapper = new ObjectMapper();
                    BaseRspDto<String> error = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                            new TypeReference<BaseRspDto<String>>() {
                            }
                    );
                    Assert.assertThat("-1", is(error.getCode()));
                    Assert.assertThat(error.getErrMsg(), containsString("长度必须3到6之间"));
                });
    }

    @Test
    public void validPathParam() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/valid.json?name=lican"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("lican")));
    }

    @Test
    public void validPathParamNameError() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/valid.json?errorName=lican"))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void validPathParamValueError() throws Exception {
        MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/valid.json?name=lc"))
                .andExpect(status().isOk())
                .andReturn();

        ObjectMapper objectMapper = new ObjectMapper();
        BaseRspDto<String> error = objectMapper.readValue(result.getResponse().getContentAsString(),
                new TypeReference<BaseRspDto<String>>() {
                }
        );
        Assert.assertThat("-1", is(error.getCode()));
        /**
         * size 未定义message，则是默认提供的提示信息
         */
        Assert.assertThat(error.getErrMsg(), containsString(" size must be between 3 and 6"));
    }
}