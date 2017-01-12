package com.healthcare.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @Title: SystemInterceptor
 * @Description: 系统拦截器 
 *
 * @author: 114-FEI
 * @date: 2017年1月6日 下午2:44:30
 *
 */
@Repository
public class SystemInterceptor implements HandlerInterceptor {

	protected final Log logger = LogFactory.getLog(getClass()); 
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		//response.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html;charset=UTF-8");
		
		// 不过滤的URI
		String[] notFilter = new String[] {
				"/assets",
				"/upload",
				"/account",
				"/captcha/getCaptcha"};
		
		// 请求的URI
		String uri = request.getRequestURI();
		
		// 是否过滤
		Boolean doFilter = true;
		for (String s : notFilter) {
			if (-1 != uri.indexOf(s)) {
				doFilter = false;
				break;
			}
		}
		
		if (doFilter) {
			
			// 从session中获取登录者的实体
			Object obj = request.getSession().getAttribute("UserSession");
			if (null == obj) {

				// 未登录
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
				builder.append("alert(\"页面已过期，请重新登录!\");");
				builder.append("window.location.href=\"");
				builder.append(request.getContextPath());
				builder.append("/account/login\"; </script>");
				out.print(builder.toString());
				out.close();
				
				return false;
			} else {
				return true;
			}
		} else {
			return true;
		}
	}
	
	
}












