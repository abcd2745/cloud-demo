package com.lc.cloud.demo.controller.demo;

import com.github.pagehelper.Page;
import com.lc.cloud.demo.controller.SuperControllerTest;
import com.lc.cloud.demo.repository.dto.BaseRspDto;
import com.lc.cloud.demo.service.demo.PageDemoService;
import org.junit.Test;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Arrays;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.equalTo;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class DemoMockControllerTest extends SuperControllerTest {

    @MockBean
    private PageDemoService pageDemoService;

    /**
     * json测试 参考：https://blog.csdn.net/jackyrongvip/article/details/89380412
     *
     * @throws Exception
     */
    @Test
    public void testMvc() throws Exception {
        BaseRspDto<Page<String>> expected = BaseRspDto.success();
        String styleId = "F";
        Page<String> expectedPage = new Page<>();
        expectedPage.setPageSize(1);
        expectedPage.add("F1");
        expectedPage.add("F2");
        expectedPage.add("F3");
        expectedPage.add("F4");

        expectedPage.setPageSize(4);

        expected.setData(expectedPage);

        //given模拟方法调用返回 ， willReturn 模拟返回值
        given(pageDemoService.findPageSku(1, 10, "F")).willReturn(expectedPage);

        mockMvc.perform(MockMvcRequestBuilders.get("/page/{styleId}.json", styleId)
                .param("page", "1")
                .param("size", "10"))
                .andExpect(status().isOk())
                .andExpect(content().json("{\"data\":[\"F1\",\"F2\",\"F3\",\"F4\"],\"code\":\"1\",\"errMsg\":null}"))
                .andExpect(jsonPath("$.data", is(Arrays.asList("F1", "F2", "F3", "F4"))))
                .andExpect(jsonPath("$.code", equalTo("1")))
                .andDo(print());
    }

}