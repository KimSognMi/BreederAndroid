<%@page import="org.apache.ibatis.jdbc.SQL"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	MemberService service = new MemberService();
 	HashMap<String, String> map = new HashMap<>();
 	map.put("userid", request.getParameter("userid"));
 	map.put("passwd", request.getParameter("passwd"));
 	
 	MemberDTO dto = service.login(map);
 	JSONObject obj = new JSONObject();
 	if(dto!=null){
 		obj.put("username", dto.getUsername());
 		obj.put("userid", dto.getUserid());
 		obj.put("passwd", dto.getPasswd());
 		
 	}else{
 		obj.put("No", "No");
 	} 
 	
 	System.out.println(obj);
 	
 %>
 <%= obj  %>