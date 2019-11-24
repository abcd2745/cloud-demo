package com.lc.cloud.demo.controller.ant;

import com.lc.cloud.demo.controller.SuperControllerTest;
import org.junit.Test;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class PathControllerTest extends SuperControllerTest {

    @Test
    public void getAddress() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/path/testString,test/shenyang/path"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("2-path")))
                .andDo(print());
    }

    @Test
    public void getAddress2() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/path/testString/test/shenyang/path"))
                .andExpect(status().is4xxClientError())
                .andDo(print());
    }

}