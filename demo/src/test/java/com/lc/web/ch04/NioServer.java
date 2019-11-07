package com.lc.web.ch04;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;
import java.util.Iterator;

public class NioServer {

    public static void main(String[] args) {
        try (ServerSocketChannel ssc = ServerSocketChannel.open()) {

            ssc.socket().bind(new InetSocketAddress(8080));
            //设置非阻塞模式
            ssc.configureBlocking(false);
            //注册选择器
            Selector selector = Selector.open();
            ssc.register(selector, SelectionKey.OP_ACCEPT);
            //创建处理器
            Handler handler = new Handler(1024);

            while (true) {
                if (selector.select(3000) == 0) {
                    System.out.println("等待超时");
                    continue;
                }
                System.out.println("处理请求。。。");
                Iterator<SelectionKey> keyIterator = selector.selectedKeys().iterator();

                while (keyIterator.hasNext()) {
                    SelectionKey key = keyIterator.next();

                    try {
                        if (key.isAcceptable()) {
                            handler.handleAccept(key);
                        }
                        if (key.isReadable()) {
                            handler.handleRead(key);
                        }
                    } catch (Exception e) {
                        keyIterator.remove();
                        continue;
                    }
                    keyIterator.remove();
                }

            }


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static class Handler {
        private int bufferSize = 1024;
        private String localCharset = "utf8";

        public Handler() {
        }

        public Handler(int bufferSize) {
            this(bufferSize, null);
        }

        public Handler(String localCharset) {
            this(-1, localCharset);
        }

        public Handler(int bufferSize, String localCharset) {
            this.bufferSize = bufferSize;
            this.localCharset = localCharset;
        }

        public void handleAccept(SelectionKey key) throws IOException {
            SocketChannel channel = ((ServerSocketChannel) key.channel()).accept();
            channel.configureBlocking(false);
            channel.register(key.selector(), SelectionKey.OP_READ, ByteBuffer.allocate(bufferSize));
        }

        public void handleRead(SelectionKey key) throws IOException {
            try (SocketChannel sc = (SocketChannel) key.channel()) {
                //获取ByteBuffer 并重置
                ByteBuffer bf = (ByteBuffer) key.attachment();
                bf.clear();

                if (sc.read(bf) != -1) {
                    //将ByteBuffer转换为读状态
                    bf.flip();
                    //将buffer中接收到的值按编码格式保存
                    String receivedString = Charset.forName(localCharset).newDecoder().decode(bf).toString();

                    System.out.println("received from client : " + receivedString);

                    String sendString = "received data:" + receivedString;

                    bf = ByteBuffer.wrap(sendString.getBytes(localCharset));
                    sc.write(bf);
                }
            }
        }
    }
}
