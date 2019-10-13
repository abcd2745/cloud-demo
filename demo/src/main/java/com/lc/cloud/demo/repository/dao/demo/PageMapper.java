package com.lc.cloud.demo.repository.dao.demo;

import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface PageMapper {

    @Select("select skuId from hw_master_sku " +
            "where styleId like CONCAT(#{styleId},'%') and isDelete = '0'")
    List<String> findSku(@Param("styleId") String styleId);

    @Select("select skuId from hw_master_sku " +
            "where styleId like CONCAT(#{styleId},'%') and isDelete = '0'")
    Page<String> findPageSku(@Param("styleId") String styleId);

}
