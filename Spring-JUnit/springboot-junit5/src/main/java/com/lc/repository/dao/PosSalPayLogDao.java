package com.lc.repository.dao;

import com.lc.mapper.order.PosSalPayLogMapper;
import com.lc.repository.dto.PosSalPosPayLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author jit
 */
@Component("posSalPayLogDao")
public class PosSalPayLogDao {

    @Autowired
    private PosSalPayLogMapper posSalPayLogMapper;

    public int addPayLog(PosSalPosPayLog record) {
        return posSalPayLogMapper.addPayLog(record);
    }

}
