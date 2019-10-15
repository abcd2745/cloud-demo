package com.lc.cloud.demo.repository.entity.user;

import lombok.Data;

import java.util.Date;

@Data
public class User {

    private String userName;

    private Date loginDate;
}
