package net.daum.nyjp.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.daum.nyjp.web.AuthHandlerInterceptor;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter {
	
	private String ignoreUrl;
	
	public void setIgnoreUrl(String ignoreUrl) {
		this.ignoreUrl = ignoreUrl;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(AuthHandlerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
    	
    	
    	if (request.getRequestURI().equals(ignoreUrl)) {
    		return true;
    	}
    	
    	
    	boolean result = false;
    	String rootPath = "login";
    	try{
    	   logger.debug("enter intercepter");
    	   HttpSession session  =  request.getSession(false);
    	   String returl = request.getRequestURL().toString();
    	  
    	   
    	   if(session == null){
    		   response.sendRedirect(rootPath);
    		   //return super.preHandle(request, response, handler);
    		   
    	   }else{
    		   //response.sendRedirect(returl);
    		   //AdminUserBean userbean = (AdminUserBean)session.getAttribute("ADMIN_USER_BEAN");
    		   //AdminUserBean userbean =  (AdminUserBean)request.getSession().getAttribute("ADMIN_USER_BEAN");
    		   if(request.getSession().getAttribute("NYJP_USER_BEAN") == null){
    			   response.sendRedirect(rootPath);
    			   return false;
    		   }else{
    			   return super.preHandle(request, response, handler);
    		   }
    		   
    	   }
    	   
    	   
    	      
    	  }catch(Exception e){
	    	  e.printStackTrace();
	    	  logger.debug(e.getMessage());
	    	  return false;
    	  }
    	  
    	  return result;
    	
	}

}
