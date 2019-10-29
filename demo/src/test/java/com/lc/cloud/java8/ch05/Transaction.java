package com.lc.cloud.java8.ch05;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Transaction {

    private Trader trader;

    private int year;

    private int value;

}
