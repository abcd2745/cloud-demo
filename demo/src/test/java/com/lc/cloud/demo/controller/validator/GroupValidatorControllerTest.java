package com.lc.cloud.demo.controller.validator;

import java.util.HashMap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.lc.cloud.demo.controller.SuperControllerTest;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.repository.dto.valid.GroupValidatorReqDto;
import com.lc.cloud.demo.repository.dto.valid.ValidatorRspDto;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;


import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.hamcrest.CoreMatchers.is;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class GroupValidatorControllerTest extends SuperControllerTest {

    @Test
    public void groupValidator() throws Exception {

        GroupValidatorReqDto reqDto = new GroupValidatorReqDto();
        reqDto.setName("123456");
        reqDto.setPass("123");

        mockMvc.perform(MockMvcRequestBuilders.post("/groupValidator.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
                .andExpect(status().isOk())
                .andDo(new ResultHandler() {
                    @Override
                    public void handle(MvcResult mvcResult) throws Exception {
                        BaseRspDto<List<FieldError>> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                                new TypeReference<BaseRspDto<List<FieldError>>>() {
                                }
                        );
                        Assert.assertThat("1", is(rspDto.getCode()));
                        Assert.assertThat(Collections.emptyList(), is(rspDto.getData()));
                    }
                })
                .andDo(print());
    }

    /**
     * controller 指定了分组 MyGroup
     * MyGroup extends Default  会把未
     *
     * @throws Exception
     */
    @Test
    public void groupValidator2() throws Exception {
        GroupValidatorReqDto reqDto = new GroupValidatorReqDto();
        reqDto.setName("1234567890");
        reqDto.setPass("1234");

        mockMvc.perform(MockMvcRequestBuilders.post("/groupValidator.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
                .andExpect(status().isOk())
                .andDo(new ResultHandler() {
                    @Override
                    public void handle(MvcResult mvcResult) throws Exception {

                        BaseRspDto<Map<String, Integer>> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                                new TypeReference<BaseRspDto<Map<String, Integer>>>() {
                                }
                        );
                        Assert.assertThat("1", is(rspDto.getCode()));
                        Assert.assertNotNull(rspDto.getData());
                        Map<String, Integer> map = rspDto.getData();

                        Assert.assertThat(2, is(map.get("name")));
                        Assert.assertThat(1, is(map.get("pass")));
                    }
                })
                .andDo(print());
    }

    /**
     * 分组 MyGroupNoExtendsDefault 没有继承 Default
     * 那么在字段上的验证（未指定分组的验证） 是不会生效的
     *
     * @throws Exception
     */
    @Test
    public void groupNoExtendsDefaultValidator() throws Exception {

        GroupValidatorReqDto reqDto = new GroupValidatorReqDto();
        reqDto.setName("1234567890");
        reqDto.setPass("1234");

        mockMvc.perform(MockMvcRequestBuilders.post("/groupNoExtendsDefaultValidator.json")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(reqDto)))
                .andExpect(status().isOk())
                .andDo(new ResultHandler() {
                    @Override
                    public void handle(MvcResult mvcResult) throws Exception {

                        BaseRspDto<Map<String, Integer>> rspDto = objectMapper.readValue(mvcResult.getResponse().getContentAsString(),
                                new TypeReference<BaseRspDto<Map<String, Integer>>>() {
                                }
                        );
                        Assert.assertThat("1", is(rspDto.getCode()));
                        Assert.assertNotNull(rspDto.getData());
                        Map<String, Integer> map = rspDto.getData();

                        Assert.assertThat(1, is(map.get("name")));
                        Assert.assertThat(1, is(map.get("pass")));
                    }
                })
                .andDo(print());
    }
}