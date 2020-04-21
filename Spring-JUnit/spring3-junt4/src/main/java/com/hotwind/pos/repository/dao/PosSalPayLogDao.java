package com.hotwind.pos.repository.dao;
import com.hotwind.pos.mapper.order.PosSalPayLogMapper;
import com.hotwind.pos.repository.dto.PosSalPosPayLog;
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
