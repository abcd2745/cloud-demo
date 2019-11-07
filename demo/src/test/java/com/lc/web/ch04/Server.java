package com.lc.web.ch04;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

    public static void main(String[] args) {
        try (ServerSocket server = new ServerSocket(8080);
             Socket socket = server.accept();
             InputStreamReader isr = new InputStreamReader(socket.getInputStream());
             BufferedReader is = new BufferedReader(isr);
             OutputStream ous = socket.getOutputStream();
             PrintWriter pw = new PrintWriter(ous)) {

            String line = is.readLine();
            System.out.println("received  from client:" + line);

            pw.println("received data:" + line);
            pw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
