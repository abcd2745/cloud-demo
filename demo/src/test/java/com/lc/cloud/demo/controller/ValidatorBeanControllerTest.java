package com.lc.cloud.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ValidatorBeanControllerTest {

    @Autowired
    private MockMvc mvc;

    private static ObjectMapper objectMapper;

    @BeforeClass
    public static void beforeClass() {
        objectMapper = new ObjectMapper();
    }

    /**
     * accept 客户端希望接受的类型
     * contentType 客服端请求的类型
     *
     * @throws Exception
     */
    @Test
    public void validBean() throws Exception {

        ValidatorReqDto reqDto = new ValidatorReqDto();
        reqDto.setPattern("110.20.12.2990");

        mvc.perform(MockMvcRequestBuilders.post("/validBean.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
                .andExpect(status().isOk())
                .andDo(print());

    }
}