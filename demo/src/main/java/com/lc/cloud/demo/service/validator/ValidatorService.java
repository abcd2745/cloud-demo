package com.lc.cloud.demo.service.validator;

import com.lc.cloud.demo.repository.dto.valid.ValidatorReqDto;

public interface ValidatorService {

    /**
     * 验证
     *
     * @param dto
     * @return
     */
    boolean doValidate(ValidatorReqDto dto);
}
