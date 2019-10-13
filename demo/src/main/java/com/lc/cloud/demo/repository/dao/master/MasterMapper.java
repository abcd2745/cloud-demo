package com.lc.cloud.demo.repository.dao.master;

import com.lc.cloud.demo.repository.entity.master.MasterDto;
import com.lc.cloud.demo.repository.entity.master.MasterSku;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface MasterMapper {

    @Select("select * from hw_master_sku where skuId = #{skuId} and isDelete = '0';")
    @Results(
            id = "clusterMessage",
            value = {
                    @Result(column = "skuId", property = "skuId"),
                    @Result(column = "styleId", property = "styleId"),
                    @Result(column = "colorId", property = "colorId"),
                    @Result(column = "sizeId", property = "sizeId"),
                    @Result(column = "modifyDate", property = "modifyDate"),
                    @Result(column = "isDelete", property = "delete"),
                    @Result(column = "price", property = "price"),
                    @Result(column = "salePrice", property = "salePrice")
            }
    )
    MasterSku loadSku(@Param("skuId") String sku);

    @Select("select s.skuId,t.styleId,t.bigTypeCode,t.middleTypeCode,t.smallTypeCode from hw_master_sku s,hw_master_style t \n" +
            "where s.StyleID = t.StyleID and s.skuId = #{skuId};")
    @Results(
            id = "masterDtoMapper",
            value = {
                    @Result(column = "skuId", property = "sku"),
                    @Result(column = "styleId", property = "styleId"),
                    @Result(column = "bigTypeCode", property = "bigTypeCode"),
                    @Result(column = "middleTypeCode", property = "middleTypeCode"),
                    @Result(column = "smallTypeCode", property = "smallTypeCode")
            }
    )
    MasterDto loadSkuDto(@Param("skuId") String sku);
}
