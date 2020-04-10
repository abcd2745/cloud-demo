package com.lc.structure.list;

import java.util.Arrays;

/**
 * 顺序存储实现线性表
 */
public class SequentialList implements IList {

    /**
     * 顺序存储线性表，用数组实现
     */
    private Object[] dataList;

    /**
     * 线性表大小
     */
    private int size = 0;

    /**
     * 默认大小：10
     */
    public SequentialList() {
        this(10);
    }

    public SequentialList(int length) {
        dataList = new Object[length];
    }

    @Override
    public void clear() {
        dataList = new Object[]{};
        size = 0;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public int length() {
        return size;
    }

    /**
     * i 数组下标
     *
     * @param i
     * @return
     * @throws Exception
     */
    @Override
    public Object get(int i) {
        if (i < 0 || i >= size) {
            throw new RuntimeException("超出范围");
        }
        return dataList[i];
    }

    /**
     * 找到第i位，将后续数据全部后移1位
     *
     * @param i
     * @param x
     * @throws Exception
     */
    @Override
    public void insert(int i, Object x) {
        if (i < 0 || i > size || i >= dataList.length) {
            throw new RuntimeException("超出范围");
        }
        if (i == size) {
            dataList[size] = x;
            size++;
            return;
        }
        for (int index = size; index > i; index--) {
            dataList[index] = dataList[index - 1];
        }
        dataList[i] = x;
        size++;
    }

    @Override
    public void insert(Object x) {
        insert(size, x);
    }

    /**
     * 找到第i位，后面数据全部前移1位
     *
     * @param i
     * @throws Exception
     */
    @Override
    public void remove(int i)  {
        if (i < 0 || i >= size) {
            throw new RuntimeException("超出范围");
        }

        for (int index = i; index < size; index++) {
            dataList[i] = dataList[i + 1];
        }
        dataList[size] = null;
        size--;
    }

    /**
     * 只去第一个下标
     *
     * @param x
     * @return
     */
    @Override
    public int indexOf(Object x) {
        for (int index = 0; index < size; index++) {
            if (x == null && dataList[index] == null) {
                return index;
            }
            if (x != null && dataList[index] != null) {
                if (dataList[index].equals(x)) {
                    return index;
                }
            }
        }
        return -1;
    }

    @Override
    public void display() {
        System.out.println(Arrays.toString(dataList));
    }
}
