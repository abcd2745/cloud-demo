package com.lc.structure.list;

/**
 * 链式线性表
 */
public class ChainedList implements IList {

    /**
     * 保存头结点
     */
    private Node header = null;

    /**
     * 线性表长度
     */
    private int size = 0;

    @Override
    public void clear() {
        header = null;
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
     * @param i
     * @return
     * @throws Exception
     */
    @Override
    public Object get(int i) {
        if (i < 0 || i >= size) {
            throw new RuntimeException("超出范围");
        }
        Node node = header;
        int index = 0;
        while (index < i) {
            node = node.next;
            index++;
        }
        return node.getData();

    }

    /**
     * i 是下标
     * size  是长度
     *
     * @param i
     * @param x
     * @throws Exception
     */
    @Override
    public void insert(int i, Object x) {
        if (i < 0 || i > size) {
            throw new RuntimeException("超出范围");
        }
        if (header == null) {
            //这时候size = 0，i 只能是0 才能insert
            header = new Node(x, null);
            return;
        }
//        //找到第i个元素，前驱指向要插入的node，node后继指向原元素i
        Node node = header;
        if (i == 0) {
            header = new Node(x, node);
            size++;
            return;
        }

        int index = 0;
        while (index < i - 1) {
            node = node.next;
            index++;
        }

        //这时候的node 是什么 ？ 第i位 的前驱元素
        Node _nodeI = node.next;

        node.next = new Node(x, _nodeI);
        size++;
    }

    /**
     * 这个是新增在尾部
     *
     * @param x
     * @throws Exception
     */
    @Override
    public void insert(Object x) {
        if (header == null) {
            header = new Node(x, null);
            size++;
            return;
        }

        Node node = header;

        while (node.next != null) {
            node = node.next;
        }

        node.next = new Node(x, null);
        size++;
    }

    /**
     * 删除，前驱的next 直接指向后继
     *
     * @param i
     */
    @Override
    public void remove(int i) {

        if (i < 0 || i >= size) {
            throw new RuntimeException("超出范围");
        }
        //前驱没有 -->  删除的是header
        if (i == 0) {
            header = header.next;
            size--;
            return;
        }
        //找到前驱元素
        int index = 0;
        Node node = header;
        while (index < i - 1) {
            node = node.next;
            index++;
        }
        //node 已经是前驱元素
        if (node.next.next == null) {
            node.next = null;
        } else {
            node.next = node.next.next;
        }
        size--;
    }

    @Override
    public int indexOf(Object x) {
        Node node = header;
        if ((node.data == null && x == null) || node.data.equals(x)) {
            return 1;
        }
        int index = 0;
        while (index < size) {
            node = node.next;
            index++;
            if ((node.data == null && x == null) || node.data.equals(x)) {
                break;
            }
        }
        return index;
    }

    @Override
    public void display() {
        if (header == null) {
            return;
        }
        System.out.println(header);
    }

    /**
     * 定义节点结构
     */
    private class Node {

        /**
         * 数据域
         */
        Object data;

        /**
         * 指针域
         */
        Node next;

        public Node() {
        }

        public Node(Object data, Node next) {
            this.data = data;
            this.next = next;
        }

        public Object getData() {
            return data;
        }

        public void setData(Object data) {
            this.data = data;
        }

        public Node getNext() {
            return next;
        }

        public void setNext(Node next) {
            this.next = next;
        }

        @Override
        public String toString() {
            return "Node{" +
                    "data=" + data +
                    ", next=" + next +
                    '}';
        }
    }
}
