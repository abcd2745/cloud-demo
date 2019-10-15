package com.lc.cloud.demo.controller.format;

import com.lc.cloud.demo.controller.SuperControllerTest;
import org.junit.Test;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * WebMvcConfigurer 配置格式化 addFormatters(FormatterRegistry registry)
 */
public class FormatterControllerTest extends SuperControllerTest {

    /**
     * controller 接收Date类型
     * 通过addFormatters 将指定格式：yyyy-MM-dd HH:mm:ss 的字符串转成json
     *
     * @throws Exception
     */
    @Test
    public void user() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/user.json")
                .param("userName", "lican")
                .param("loginDate", "2019-10-11 10:24:10"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("{\"userName\":\"lican\",\"loginDate\":\"2019-10-11T02:24:10.000+0000\"}")));
    }


    @Test
    public void getDate() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/getDate.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(not("1999-12-31 23:59:59")))
                .andDo(print());
    }
}
