package com.lc.websocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/websocket")
public class WebSocketTest {
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;

	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<>();


	private ConcurrentHashMap<String, Session> sessionMap = new ConcurrentHashMap<>();


	/**
	 * 连接建立成功调用的方法
	 *
	 * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(Session session) throws IOException {

		Map<String, List<String>> param = session.getRequestParameterMap();

		if (param.containsKey("posId")) {
			String posId = param.get("posId").get(0) ;
			sessionMap.put(posId, session);

			session.getBasicRemote().sendText(posId);
		}

		webSocketSet.add(this);     //加入set中
		addOnlineCount();           //在线数加1
		System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		webSocketSet.remove(this);  //从set中删除
		subOnlineCount();           //在线数减1
		System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
	}

	/**
	 * 收到客户端消息后调用的方法
	 *
	 * @param message 客户端发送过来的消息
	 * @param session 可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("来自客户端的消息:" + message);
		sendMessage(session,message);
//		//群发消息
//		for (WebSocketTest item : webSocketSet) {
//			try {
////				item.session.getAsyncRemote().sendText("123");
//
//			} catch (IOException e) {
//				e.printStackTrace();
//				continue;
//			}
//		}
	}

	/**
	 * 发生错误时调用
	 *
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 *
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(Session session,String message) throws IOException {
//		System.out.println("sendMessage:" + message);
//		this.session.getBasicRemote().sendText(message);
		session.getAsyncRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		System.out.println("getOnlineCount()");
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		System.out.println("addOnlineCount()");
		WebSocketTest.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		System.out.println("subOnlineCount()");
		WebSocketTest.onlineCount--;
	}
}
