package com.lc.cloud.demo.controller.ant;

import com.lc.cloud.demo.controller.SuperControllerTest;
import org.junit.Test;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.Matchers.equalTo;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class AntPathControllerTest extends SuperControllerTest {

    /**
     * 匹配单个字符
     *
     * @throws Exception
     */
    @Test
    public void patternCharTest() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/a/path.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("?")))
                .andDo(print());
    }

    /**
     * 通过命名式的正则表达式获取路径参数
     *
     * @throws Exception
     */
    @Test
    public void patternCharPath() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/a/pathChar.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("?a")))
                .andDo(print());
    }

    /**
     * 匹配单个字符串
     * * 代表0+ 个字符
     * 路径 /ant/path.json 匹配的是 /**\/path.json
     *
     * @throws Exception
     */
    @Test
    public void path() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/testString/path.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("path")))
                .andDo(print());
    }

    @Test
    public void path2() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/testString"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("*通配符表示匹配零个或者多个字符，但必须是在一个路径分段中！")))
                .andDo(print());
    }

    /**
     * 对比请求 /*\/path.json
     * * 匹配0 个字符时，必须是在同一个路径分段
     *
     * @throws Exception
     * @see AntPathControllerTest.path()
     */
    @Test
    public void path2Empty() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("*通配符表示匹配零个或者多个字符，但必须是在一个路径分段中！")))
                .andDo(print());
    }

    @Test
    public void pathWord() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/testString/pathWord.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("pathtestString")))
                .andDo(print());
    }

    @Test
    public void path3() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/ant/testString/testString2/String3/path.json"))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo("path3")))
                .andDo(print());
    }
}