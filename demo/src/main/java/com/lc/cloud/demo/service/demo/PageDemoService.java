package com.lc.cloud.demo.service.demo;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lc.cloud.demo.repository.dao.demo.PageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PageDemoService {

    @Autowired
    private PageMapper pageMapper;

    public PageInfo<String> findDemoList(int page, int size, String styleId) {
        // 开启分页插件,放在查询语句上面 帮助生成分页语句
        //底层实现原理采用改写语句   将下面的方法中的sql语句获取到然后做个拼接 limit  AOPjishu
        PageHelper.startPage(page, size);
        List<String> listDemo = pageMapper.findSku(styleId);
        // 封装分页之后的数据  返回给客户端展示  PageInfo做了一些封装 作为一个类
        PageInfo<String> pageInfoDemo = new PageInfo<>(listDemo);
        //所有分页属性都可以冲pageInfoDemo拿到；
        return pageInfoDemo;
    }

    public Page<String> findPageSku(int page, int size, String styleId) {
        // 开启分页插件,放在查询语句上面 帮助生成分页语句
        //底层实现原理采用改写语句   将下面的方法中的sql语句获取到然后做个拼接 limit  AOPjishu
        PageHelper.startPage(page, size);
        Page<String> listDemo = pageMapper.findPageSku(styleId);
        return listDemo;
    }
}
