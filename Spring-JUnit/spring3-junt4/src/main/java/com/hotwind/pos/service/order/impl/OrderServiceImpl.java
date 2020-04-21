package com.hotwind.pos.service.order.impl;

import com.hotwind.pos.mapper.notice.GrabNoticeMapper;
import com.hotwind.pos.mapper.order.PosSalPosMstMapper;
import com.hotwind.pos.repository.dto.PosSalPosPayLog;
import com.hotwind.pos.service.order.IOrderService;
import com.hotwind.pos.repository.dao.PosSalPayLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author jit
 */
@Transactional(value = "txManager", rollbackFor = Exception.class)
@Service("orderService")
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private PosSalPayLogDao posSalPaySdDao;

    @Autowired
    @Qualifier("grabNoticeMapper")
    private GrabNoticeMapper grabNoticeMapper;

    @Autowired
    @Qualifier("posSalPosMstMapper")
    private PosSalPosMstMapper posSalPosMstMapper;

    public static final String RULE_CODE_SAL_PAY_LOG = "hw_pos_salpospay_log";

    @Override
    public int addPayLog(PosSalPosPayLog posPayLog) {
        posPayLog.setModifyUserId(posPayLog.getCreateUserId());
        int i = posSalPaySdDao.addPayLog(posPayLog);
        int j = grabNoticeMapper.insertNotice(RULE_CODE_SAL_PAY_LOG);
        return i + j;
    }

    @Override
    public synchronized String selectMaxBillNo(String storeId, String posId) {
        String maxBillNo = posSalPosMstMapper.selectMaxBillNo(storeId, posId);
        String nextBillNo = getResultBillNo(posId, maxBillNo);
        //这个验证应该可以忽略的，因为每个pos机都是流水操作，只有多台机器配置了相同posId才可能出现问题
        String existBillNo = posSalPosMstMapper.loadBillNo(nextBillNo);
        if (!StringUtils.isEmpty(existBillNo)) {
            throw new RuntimeException("POS机生成的单号已存在，请重试!");
        }
        return nextBillNo;
    }

    private String getResultBillNo(String posId, String billNo) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

        if (StringUtils.isEmpty(billNo)) {
            billNo = posId + sdf.format(new Date()) + "00001";
        } else {
            String prefixNo = billNo.substring(0, 15);
            String suffixNo = String.valueOf(Integer.parseInt(billNo.substring(15)) + 1);

            StringBuffer temp = new StringBuffer("");
            for (int i = 0; i < (5 - suffixNo.length()); i++) {
                temp.append("0");
            }
            billNo = prefixNo + temp.toString() + suffixNo;
        }
        return billNo;
    }
}