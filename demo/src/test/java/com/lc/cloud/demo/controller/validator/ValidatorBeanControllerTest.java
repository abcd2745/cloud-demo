package com.lc.cloud.demo.controller.validator;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
import org.junit.Assert;
import org.junit.BeforeClass;
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

import java.util.Arrays;
import java.util.Date;

import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.CoreMatchers.is;
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
        reqDto.setList(Arrays.asList(1, 2, 3));
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
                .andExpect(status().isOk())
                .andDo(mvcResult -> {
                    BaseRspDto<ValidatorRspDto> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                            new TypeReference<BaseRspDto<ValidatorRspDto>>() {
                            }
                    );
                    Assert.assertThat("1", is(rspDto.getCode()));
                    Assert.assertThat(2, is(rspDto.getData().getValid()));
                })
                .andDo(print());
    }

    @Test
    public void validBean2() throws Exception {
        ValidatorReqDto reqDto = new ValidatorReqDto();
        //ip
        reqDto.setPattern("10.1.4.610");
        //18~70
        reqDto.setAge(30);
        reqDto.setBirthday(new Date(1571022571880L));
        reqDto.setEmail("abcd2745@sohu.com");
        reqDto.setExpire(new Date(1581022571880L));
        reqDto.setFlag(true);
        reqDto.setList(Arrays.asList(1, 2, 3));
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
                .andExpect(status().isOk())
                .andDo(mvcResult -> {
                    BaseRspDto<ValidatorRspDto> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                            new TypeReference<BaseRspDto<ValidatorRspDto>>() {
                            }
                    );
                    Assert.assertThat("-1", is(rspDto.getCode()));
                })
                .andDo(print());
    }

    @Test
    public void validBean3() throws Exception {
        ValidatorReqDto reqDto = new ValidatorReqDto();
        //ip
        reqDto.setPattern("10.1.4.610");
        //18~70
        reqDto.setAge(30);
        reqDto.setBirthday(new Date(1571022571880L));
        reqDto.setEmail("abcd2745@sohu.com");
        reqDto.setExpire(new Date(1581022571880L));
        reqDto.setFlag(true);
        reqDto.setList(Arrays.asList(1, 2, 3));
        reqDto.setName("lican");
        reqDto.setPass("123");
        reqDto.setUrl("https://www.baidu.com");
        /*5 ~ 10*/
        reqDto.setRange(6);
        /* > 10*/
        reqDto.setSalary(11);

        mvc.perform(MockMvcRequestBuilders.post("/validBeanBindingResult.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
                .andExpect(status().isOk())
                .andDo(mvcResult -> {
                    BaseRspDto<ValidatorRspDto> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                            new TypeReference<BaseRspDto<ValidatorRspDto>>() {
                            }
                    );
                    Assert.assertThat("1", is(rspDto.getCode()));
                    ValidatorRspDto validator = rspDto.getData();
                    Assert.assertThat(validator.getName(), containsString("pattern"));
                })
                .andDo(print());
    }
}