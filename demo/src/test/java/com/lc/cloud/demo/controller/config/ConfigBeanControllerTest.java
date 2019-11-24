package com.lc.cloud.demo.controller.config;

import com.lc.cloud.demo.controller.SuperControllerTest;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNull.notNullValue;
import static org.springframework   .test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class ConfigBeanControllerTest extends SuperControllerTest {

    @Test
    public void getConfigBean() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/getConfigBean").accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name",is("forezp")))
                .andExpect(jsonPath("$.number" ,notNullValue()))
                .andDo(print());
    }

    @Test
    public void getYmlConfigBean() {
    }
}