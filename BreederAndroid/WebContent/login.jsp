<%@page import="java.util.HashMap"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userid = request.getParameter("userid");
   String passwd = request.getParameter("passwd");
    
   MemberService service = new MemberService();
   HashMap<String, String> map= new HashMap<>();
   map.put("userid", userid);
   map.put("passwd", passwd);
   MemberDTO dto = service.login(map);

   String mesg = "success";
   if(dto == null){
      mesg = "fail";   
   }else{   
      MemberDTO dto3 =service.mypage(userid);
      
      mesg=dto3.toString();
      int m_num=dto3.getM_num();
      String muserid=dto3.getUserid();
      String mpasswd=dto3.getPasswd();
      String username=dto3.getUsername();
      String phone=dto3.getPhone();
      String post1=dto3.getPost1();
      String post2=dto3.getPost2();
      String addr1=dto3.getAddr1();       
      String addr2=dto3.getAddr2(); 
      
      mesg=m_num+"/"+muserid+"/"+mpasswd+"/"+username+"/"+phone+"/"+post1+"/"+post2+"/"+addr1+"/"+addr2;
   }
   System.out.println(mesg);
%>
<%=mesg %>