package com.lc.structure.list;

/**
 * 循环链表
 */
public class CycleChainedList<T> {

    /**
     * 头结点
     */
    private Node<T> header;

    /**
     * 尾结点
     */
    private Node<T> tail;

    private int size;

    /**
     * 头尾相连
     */
    public CycleChainedList() {
        header = null;
        tail = null;
        size = 0;
    }

    public boolean isEmpty() {
        return header == null;
    }

    public void add(T data) {

        if (header == null) {
            header = new Node(data);
            header.next = tail;
        }

    }

    public class Node<T> {

        T data;

        private Node<T> next;

        public Node(T data) {
            this.data = data;
            this.next = null;
        }

        public Node(T data, Node<T> next) {
            this.data = data;
            this.next = next;
        }

        public T getData() {
            return data;
        }

        public Node<T> getNext() {
            return next;
        }

        public void setNext(Node<T> next) {
            this.next = next;
        }
    }
}
