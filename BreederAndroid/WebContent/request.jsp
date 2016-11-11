<%@page import="com.dto.RequestPetDTO"%>
<%@page import="com.service.RequestService"%>
<%@page import="com.dto.PetDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.service.PetService"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String requestid = request.getParameter("userid");
	
	RequestService requestService = new RequestService();
	
	List<RequestPetDTO> requestList = (List<RequestPetDTO>) requestService.requestlist2(requestid);
	List<RequestPetDTO> answerList = (List<RequestPetDTO>) requestService.answer(requestid);
	String mesg = "";
	String mesg2 = "";
	if(requestList == null){
		mesg = "fail";   
		mesg2 = "fail"; 
	}else{   
		  
		    for(RequestPetDTO dto5 : requestList){
		    System.out.println(">>>>" + dto5);
		
		      mesg+=dto5.getAgree()+"/";
		      mesg+=dto5.getP_gender()+"/";
		      mesg+=dto5.getP_name()+"/";
		      mesg+=dto5.getP_photo()+"/";
		      mesg+=dto5.getP_type()+"/";
		      mesg+=dto5.getPhone()+"/";
		      mesg+=dto5.getR_content()+"/";
		      mesg+=dto5.getUserid()+"/";
		      mesg+=dto5.getP_age()+"/";
		      mesg+=dto5.getP_num()+"/";
		      mesg+=dto5.getR_num()+"/";
		      
		    }	
			
			System.out.println(">>>>" + mesg);
		
			for(RequestPetDTO dto6 : answerList){
			    System.out.println(">>>>" + dto6);
			
			      mesg2+=dto6.getAgree()+"/";
			      mesg2+=dto6.getP_gender()+"/";
			      mesg2+=dto6.getP_name()+"/";
			      mesg2+=dto6.getP_photo()+"/";
			      mesg2+=dto6.getP_type()+"/";
			      mesg2+=dto6.getPhone()+"/";
			      mesg2+=dto6.getR_content()+"/";
			      mesg2+=dto6.getUserid()+"/";
			      mesg2+=dto6.getP_age()+"/";
			      mesg2+=dto6.getP_num()+"/";
			      mesg2+=dto6.getR_num()+"/";
			      
			    }	
				
				System.out.println(">>>>" + mesg2);
		
	}
	mesg = mesg+mesg2;
	System.out.println(mesg);
%>
<%=mesg %>