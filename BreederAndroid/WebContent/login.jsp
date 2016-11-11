<%@page import="com.dto.PetDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.service.PetService"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	String p_num = request.getParameter("p_num");
    
	MemberService service = new MemberService();
	PetService p_service = new PetService();
	HashMap<String, String> map= new HashMap<>();
	map.put("userid", userid);
	map.put("passwd", passwd);
	MemberDTO dto = service.login(map);

	String mesg = "success";
	String mesg2 ="";
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
		
		
		PetService service2 = new PetService();
		    List<PetDTO> list = service2.list(muserid);
		  
		    for(PetDTO dto4 : list){
		    System.out.println(">>>>" + dto4);
		
		      mesg2+=dto4.getP_num()+"/";
		      mesg2+=dto4.getUserid()+"/";
		      mesg2+=dto4.getP_kkcnumber()+"/";
		      mesg2+=dto4.getP_name()+"/";
		      mesg2+=dto4.getP_age()+"/";
		      mesg2+=dto4.getP_gender()+"/";
		      mesg2+=dto4.getP_birth()+"/";
		      mesg2+=dto4.getP_type()+"/";
		      mesg2+=dto4.getP_photo()+"/";
		      mesg2+=dto4.getP_feature()+"/";
		      mesg2+=dto4.getMom_kkc()+"/";
		      mesg2+=dto4.getPapa_kkc();
		    }	
			
			System.out.println(">>>>" + mesg2);
		
		mesg=m_num+"/"+muserid+"/"+mpasswd+"/"+username+"/"+phone+"/"+post1+"/"+post2+"/"+addr1+"/"+addr2+"&"+mesg2;
	}
	System.out.println(mesg);
%>
<%=mesg %>