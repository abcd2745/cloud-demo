package com.lc.binlog;

import lombok.Data;

@Data
public class GrabNoticeEntity {
    private Integer noticeId;

    private String ruleCode;

    private String needProcessTime;
    private String startProcessTime;
    private String endProcessTime;

    private int processStatus;
    private String errorMessage;
}
