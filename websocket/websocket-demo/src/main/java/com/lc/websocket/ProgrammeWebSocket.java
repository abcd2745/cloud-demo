package com.lc.websocket;

import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.MessageHandler;
import javax.websocket.Session;
import java.io.IOException;

/**
 * 编程是实现 webSocket
 *
 * @author Thinkpad
 */
public class ProgrammeWebSocket extends Endpoint {

	@Override
	public void onOpen(Session session, EndpointConfig endpointConfig) {
		session.addMessageHandler((MessageHandler.Whole<String>) s -> {
			try {
				session.getBasicRemote().sendText(s);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}
}
