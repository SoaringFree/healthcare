package com.healthcare.websocket;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

@Component
public class HandShakeInterceptor implements HandshakeInterceptor {

	protected final Log logger = LogFactory.getLog(getClass());
	
	
	/**
	 * 进入handler之前的拦截
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler websocketHandler,
			Map<String, Object> attributes) throws Exception {
		
		logger.info(String.format("###---> Go into HandShakeInterceptor : %s...", "WHY"));
		
		String userId =  ((ServletServerHttpRequest) request).getServletRequest().getParameter("userId"); 
		
		logger.info(String.format("###---> Go into HandShakeInterceptor : %s...", userId));
		
		if(userId != null){  
            attributes.put("userId", userId);  
        }else{  
            return false;  
        } 
		
        return true;
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest arg0, ServerHttpResponse arg1,
			WebSocketHandler arg2, Exception arg3) {
		// TODO Auto-generated method stub
		
	}

}
