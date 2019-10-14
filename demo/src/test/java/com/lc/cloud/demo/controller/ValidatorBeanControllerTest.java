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

import java.util.Arrays;
import java.util.Date;

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
        //ip
        reqDto.setPattern("10.1.4.60");
        //18~70
        reqDto.setAge(30);
        reqDto.setBirthday(new Date(1571022571880L));
        reqDto.setEmail("abcd2745@sohu.com");
        reqDto.setExpire(new Date(1581022571880L));
        reqDto.setFlag(true);
        reqDto.setList(Arrays.asList(1,2,3));
        reqDto.setName("lican");
        reqDto.setPass("123");
        reqDto.setUrl("https://www.baidu.com");
        /*5 ~ 10*/
        reqDto.setRange(6);
        /* > 10*/
        reqDto.setSalary(11);

        mvc.perform(MockMvcRequestBuilders.post("/validBean.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
               // .andExpect(status().isOk())
                .andDo(print());

    }
}