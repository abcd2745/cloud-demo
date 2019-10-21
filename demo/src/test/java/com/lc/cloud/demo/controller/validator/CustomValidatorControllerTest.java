package com.lc.cloud.demo.controller.validator;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
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
public class CustomValidatorControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    public void customValidPathVariable() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/customValid/lican1.json").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("lican1")));
    }

    /**
     * 这里是默认的message
     *
     * @throws Exception
     */
    @Test
    public void customValidPathVariableError() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/customValid/li1211.json").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print())
                .andDo(new ResultHandler() {

                    @Override
                    public void handle(MvcResult mvcResult) throws Exception {
                        ObjectMapper objectMapper = new ObjectMapper();
                        BaseRspDto<String> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                                new TypeReference<BaseRspDto<String>>() {
                                }
                        );
                        //这串是提示信息
                        Assert.assertThat(rspDto.getErrMsg(), containsString("这个是自定义异常，必须包含字符串lican,并且长度不能大于8"));
                    }
                });
    }
}