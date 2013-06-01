package net.daum.nyjp.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.daum.nyjp.bean.AdminUserBean;
import net.daum.nyjp.bo.DAOController;
import net.daum.nyjp.dao.CommonDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NYJPWebController {

	@Autowired
	private CommonDAO commonDAO;
	private static final Logger logger = LoggerFactory.getLogger(NYJPWebController.class);
	
	private final String JS_HOST = "http://160.59.156.22:8081/pushNote";	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest req, HttpServletResponse rep) {		
		ModelAndView modelAndView = new ModelAndView("login");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
				
		if(id != null && pw != null){	
			List<Map<String, Object>> userList = DAOController.getUserInfo(commonDAO);
			
			for(Map<String, Object> user : userList){
				if( id.equals(user.get("email")) && pw.equals(user.get("pw")) ){
					AdminUserBean userbean = new AdminUserBean();
					userbean.setUserId(id);
					req.getSession().setAttribute("NYJP_USER_BEAN", userbean);
					
					try {
						if(userbean.getUserId() != null){
							rep.sendRedirect("show");
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(HttpServletRequest req, HttpServletResponse rep) {

		ModelAndView modelAndView = new ModelAndView("show");
		String userId = getUserId(req);
		modelAndView.addObject("userId", userId);
				
		List<Map<String, Object>> userList = DAOController.getUserInfo(commonDAO);
    	modelAndView.addObject("userList", userList);
    	
    	List<Map<String, Object>> presentationList = DAOController.getPresentationList(commonDAO, userId);
    	modelAndView.addObject("presentationList", presentationList);
    	
    	modelAndView.addObject("jsHost", JS_HOST);

    	/* YG */
    	
//	    String line, results;    	
//    	try{
//    		BufferedReader reader = new BufferedReader(new FileReader("/Users/go/Desktop/"+fileName+".html"));
//    	    results = "";
//    	    while( ( line = reader.readLine() ) != null)
//    	    {
//    	        results += line;
//    	    }
//    	    reader.close();    	    		
//    	}catch( Exception e ){
//    		
//    	}
    	
	    /* YG */
    	
		return modelAndView;
	}
	
	@RequestMapping(value = "/make")
	public ModelAndView make(HttpServletRequest req, HttpServletResponse rep) throws IOException {
		ModelAndView modelAndView = new ModelAndView("make");
		String pid = null;
		String userId = getUserId(req);
		String html = ServletRequestUtils.getStringParameter(req, "html", "");
		//html = new String( html.getBytes("iso-8859-1"), "utf-8" );
		String title = ServletRequestUtils.getStringParameter(req, "title", "");
		String description = ServletRequestUtils.getStringParameter(req, "description", "");
		
		if(!"".equals(html) && !"".equals(title) ){
			int totNum = DAOController.getPresentationTotalNum(commonDAO, userId);
			totNum++;
			
			pid = userId+totNum;
			DAOController.insertPresentationInfo(commonDAO, title, description, userId, pid);
		}
		System.out.println(html);
		if(pid != null){
			
			BufferedReader headReader = new BufferedReader(new FileReader("/Users/go/Desktop/impressHead.html"));
		    String line, header = "";
		    while( ( line = headReader.readLine() ) != null)
		    {
		        header += line;
		    }
		    headReader.close();
		    
		    BufferedReader footReader = new BufferedReader(new FileReader("/Users/go/Desktop/impressFoot.html"));
		    String footLine, footer = "";
		    while( ( footLine = footReader.readLine() ) != null)
		    {
		        footer += footLine;
		    }
		    footReader.close();
		    
		    
		    String results = header + html + footer;
		    
		    System.out.println(results);
		   /* 
			File presentationFile = new File("/Users/go/Desktop/"+pid+".html");
	        try {
	        	presentationFile.createNewFile();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			*/
	        try{
        	   InputStream in = new ByteArrayInputStream(results.getBytes("UTF-8"));
        	   
        	   FileOutputStream fos = new FileOutputStream("/Users/go/Desktop/"+pid+".html");
        	   
        	   BufferedInputStream bis = new BufferedInputStream(in);
        	   BufferedOutputStream bos = new BufferedOutputStream(fos);
        	   
        	   int len=0;
        	   byte[]buf = new byte[1024];
        	   while((len=bis.read(buf,0,1024))!=-1){
        		   bos.write(buf,0,len);
        	   }
        	   
        	   //close
        	   bos.close();
        	   bis.close();
        	   fos.close();
        	   in.close(); 
	        }catch (Exception e) {
        	   e.printStackTrace();
        	}  
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	//@ResponseBody
	public ResponseEntity<String> view(HttpServletRequest req, HttpServletResponse rep) throws IOException {
		String fileName = ServletRequestUtils.getStringParameter(req, "file", "");
		System.out.println("/Users/go/Desktop/"+fileName+".html");
		BufferedReader reader = new BufferedReader(new FileReader("/Users/go/Desktop/"+fileName+".html"));
	    String line, results = "";
	    while( ( line = reader.readLine() ) != null)
	    {
	        results += line;
	    }
	    reader.close();
	    	    

	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.set("Content-Type", "text/html; charset=utf-8");
	    return new ResponseEntity<String>(results, responseHeaders, HttpStatus.CREATED);	    
	}
	
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public ModelAndView setting() {
		ModelAndView modelAndView = new ModelAndView("setting");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact() {
		ModelAndView modelAndView = new ModelAndView("contact");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("index");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage() {
		ModelAndView modelAndView = new ModelAndView("mypage");
		
		return modelAndView;
	}
	
	private String getUserId(HttpServletRequest req){
		AdminUserBean userbean =  (AdminUserBean)req.getSession().getAttribute("NYJP_USER_BEAN");
		return userbean.getUserId();
	}
}
