package com.lc.structure.list;

/**
 * 线性表
 */
public interface IList {

    /**
     * 将一个已经存在的线性表置成空表
     */
    void clear();

    /**
     * 判断当前线性表中的数据元素个数是否为0
     *
     * @return 若为0则函数返回true，否则返回false
     */
    boolean isEmpty();

    /**
     * 求线性表中的数据元素个数并由函数返回其值
     *
     * @return
     */
    int length();

    /**
     * 读取到线性表中的第i个数据元素并由函数返回其值。其中i取值范围为：0≤i≤length()-1,如果i值不在此范围则抛出异常
     *
     * @param i
     * @return
     * @throws Exception
     */
    Object get(int i) throws Exception;

    /**
     * 在线性表的第i个数据元素之前插入一个值为x的数据元素。其中i取值范围为：0≤i≤length()。
     * 如果i值不在此范围则抛出异常,当i=0时表示在表头插入一个数据元素x,当i=length()时表示在表尾插入一个数据元素x
     *
     * @param i
     * @param x
     */
    void insert(int i, Object x);

    /**
     * 直接新增到最后一位
     *
     * @param x
     * @throws Exception
     */
    void insert(Object x);

    /**
     * 将线性表中第i个数据元素删除。其中i取值范围为：0≤i≤length()- 1,如果i值不在此范围则抛出异常
     *
     * @param i
     * @throws Exception
     */
    void remove(int i);

    /**
     * 返回线性表中首次出现指定元素的索引，如果列表不包含此元素，则返回 -1
     *
     * @param x
     * @return
     */
    int indexOf(Object x);

    /**
     * 输出线性表中的数据元素
     */
    void display();
}
