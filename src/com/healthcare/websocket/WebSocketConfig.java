package com.healthcare.websocket;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
@Controller
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer  {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		//支持websocket 的访问链接
		registry.addHandler(new HCWebSocketHandler(),"/echo").addInterceptors(new HandShakeInterceptor()); 
		
		//不支持websocket的访问链接
        registry.addHandler(new HCWebSocketHandler(),"/sockjs/echo").addInterceptors(new HandShakeInterceptor()).withSockJS(); 
		
	}
	
	/*
	@Bean  
    public HCWebSocketHandler HCWebSocketHandler() {  
        return new HCWebSocketHandler();  
    }  
    */

}
