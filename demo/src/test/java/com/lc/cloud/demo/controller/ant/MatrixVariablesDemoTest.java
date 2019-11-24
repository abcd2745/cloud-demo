package com.lc.cloud.demo.controller.ant;

import com.lc.cloud.demo.controller.SuperControllerTest;
import org.junit.Test;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MatrixVariablesDemoTest extends SuperControllerTest {

    @Test
    public void testMatrixVariables() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/matrix/testMatrixVariables/20;matrixVariable1=1;matrixVariable2=2"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testMatrixVariables2() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/matrix/testMatrixVariables2/matrixVariable=1/matrixVariable=2"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testMatrixVariables3() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/matrix/testMatrixVariables3/1"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testMatrixVariables4() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/matrix/testMatrixVariables4/a=a;b=b;c=c/a=aa;b=bb"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testMatrixVariables5() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/matrix/testMatrixVariables5/a=a;b=b;c=c/a=aa;b=bb"))
                .andExpect(status().isOk())
                .andDo(print());
    }
}