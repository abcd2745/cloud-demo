package com.hotwind.pos.mapper.notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;


/**
 * @author NewBreach
 */
@Component("grabNoticeMapper")
public interface GrabNoticeMapper {

    /**
     * 新增通知
     *
     * @param ruleCode
     * @return
     */
    int insertNotice(@Param("ruleCode") String ruleCode);

}
