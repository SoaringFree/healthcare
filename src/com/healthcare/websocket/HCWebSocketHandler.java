package com.healthcare.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

@Component
public class HCWebSocketHandler implements WebSocketHandler {

	protected final Log logger = LogFactory.getLog(getClass());
	
	public static final Map<String, WebSocketSession> userSocketSessionMap;  
	  
    static {  
        userSocketSessionMap = new HashMap<String, WebSocketSession>();  
    }  
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		
		
		String userId = session.getAttributes().get("userId").toString();
		if (null == userSocketSessionMap.get(userId)) {
			userSocketSessionMap.put(userId, session);
			logger.info(String.format("###---> HCWebSocketHandler 连接成功 : %s...", userId));
		}
		
		broadcast(new TextMessage("...welcome..."));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
			throws Exception {
		
		String userId = session.getId();
		userSocketSessionMap.remove(userId);
		
		logger.info(String.format("###---> HCWebSocketHandler 断开链接 : %s...", userId));
		
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message)
			throws Exception {
		String userId = session.getAttributes().get("userId").toString();
		
		logger.info(String.format("###---> 收到来自 [%s] 的消息 : %s...", userId, message.getPayload().toString()));
		session.sendMessage(new TextMessage("...echo..."));
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable throwble)
			throws Exception {
		
		String userId = session.getAttributes().get("userId").toString();
		userSocketSessionMap.remove(session);
		
		if(session.isOpen()) {
            session.close();
        }
		
		logger.info(String.format("###---> HCWebSocketHandler 链接出错 : %s...", userId));
		
	}

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}

	
	public void broadcast(final TextMessage message) throws IOException {  
        Iterator<Entry<String, WebSocketSession>> it = userSocketSessionMap  
                .entrySet().iterator();  
  
        // 多线程群发  
        while (it.hasNext()) {  
  
            final Entry<String, WebSocketSession> entry = it.next();  
  
            if (entry.getValue().isOpen()) {  
                new Thread(new Runnable() {  
  
                    public void run() {  
                        try {  
                            if (entry.getValue().isOpen()) {  
                                entry.getValue().sendMessage(message);  
                            }  
                        } catch (IOException e) {  
                            e.printStackTrace();  
                        }  
                    }  
  
                }).start();  
            }  
  
        }  
    }  
	
	public void sendToUser(String userId, TextMessage message) {
		// TODO
	}
	
	private void offLineHandle(String userId, TextMessage message) {
		//TODO
	}
	
}
