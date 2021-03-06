package com.lc.mapper.order;

import com.lc.repository.dto.PosSalPosPayLog;
import org.springframework.stereotype.Component;

/**
 * @author jit
 */
@Component
public interface PosSalPayLogMapper {

    /**
     * 保存数据
     *
     * @param record
     * @return
     */
    int addPayLog(PosSalPosPayLog record);
}
