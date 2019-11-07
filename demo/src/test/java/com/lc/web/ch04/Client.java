package com.lc.web.ch04;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {

    public static void main(String[] args) {
        String msg = "Client Data";

        try (Socket socket = new Socket("127.0.0.1", 8080);
             OutputStream ous = socket.getOutputStream();
             PrintWriter pw = new PrintWriter(ous);
             InputStreamReader isr = new InputStreamReader(socket.getInputStream());
             BufferedReader br = new BufferedReader(isr)) {

            pw.println(msg);
            pw.flush();

            String line = br.readLine();
            System.out.println("received from server:" + line);

        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
