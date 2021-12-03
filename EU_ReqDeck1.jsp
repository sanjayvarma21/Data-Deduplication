<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> 
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>End User </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style4 {font-size: 14px}
.style5 {font-size: 16px}
.style6 {font-size: 16}
.style7 {font-size: 18px}
.style17 {font-size: 14; }
.style18 {color: #3f3f3f}
.style22 {color: #402C16}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Login.jsp">End User </a></li>
			<li><a href="EU_Login.jsp">Logout</a></li>
        <li></li>
      </ul>
    </div>
    <div class="clr"></div>
  </div>
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1>Seure Data Deduplication in Cloud<br /></h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Request Decrypt Key  </span></h2>
            <h2></h2>
            <h2><span class="style7">
              <%
	try
	{	  
		  String dname=request.getParameter("t142");
		  String fname=request.getParameter("t14");
		  String user=(String)application.getAttribute("uname");
		  
		  SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		  
		  String query="Select *from request where user='"+user+"' and owner='"+dname+"' and fname='"+fname+"' and decryptkey='Requested'";
	      Statement st=connection.createStatement();
          ResultSet rs=st.executeQuery(query);
		  if (rs.next())
		  {
				%>
Decrypt Key Request Already Sent To Cloud !! </span> </h2>
            <p>&nbsp;</p>
            <p><a href="EU_Main.jsp">Back</a></p>
            <h2><span class="style7">
            <%
		  }
		  else
		  {
		  	 String query1="Select * from cloudserver where fname='"+fname+"' and downer='"+dname+"'";	  
			 Statement st1=connection.createStatement();
			 ResultSet rs1=st1.executeQuery(query1);
			 if (rs1.next())
			 {
			 	String duplcheck=rs1.getString(10);
			if (duplcheck.equalsIgnoreCase("Verified")||duplcheck.equalsIgnoreCase("Shared"))
			{
			  	 String query2="Select * from request where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";	  
				 Statement st2=connection.createStatement();
				 ResultSet rs2=st2.executeQuery(query2);
				 if (rs2.next())
				 {
					  String query3="update request set decryptkey='Requested' where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  
				
				%>
            Decrypt Key Request  Sent Sucessfully To Cloud  !! </span>            </h2>
            <p class="style22">&nbsp;</p>
            <p class="style22"><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a> </p>
            <h2><span class="style7">
            <%
				 }
				 else
				 {
				 
					String query3="insert into request(user,owner,fname,secretkey,decryptkey) values('"+user+"','"+dname+"','"+fname+"','No','Requested')";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  
				
				%>
            Decrypt Key Request  Sent Sucessfully To Cloud  !! </span>            </h2>
            <p class="style22">&nbsp;</p>
            <p class="style22"><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a> </p>
            <h2><span class="style7">
            <%
				 }
				}
		else
		{
			%>
          </p>
          <h2 class="style31">Please Wait For Cloud To Verify File ! </h2>
          <p><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p>
            <%
		}  
			  }
			  else
			  {
				
				%>
            File Not Found !! </span>
            </h2>
            <p class="style22">&nbsp;</p>
            <p class="style22"><a href="EU_Main.jsp">Back</a></p>
            <%
			  }
		 }
		connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		  %>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" />
            </span>
          </form>
          <div class="clr"></div>
        </div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="EU_Main.jsp">Home</a></li>
            <li><a href="EU_ViewFiles.jsp">View Files</a></li>
            <li><a href="EU_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Data Deduplication</h2>
      <img src="images/pix1.jpg" width="58" height="58" alt="" /> <img src="images/pix2.jpg" width="58" height="58" alt="" /> <img src="images/pix3.jpg" width="58" height="58" alt="" /> <img src="images/pix4.jpg" width="58" height="58" alt="" /> <img src="images/pix5.jpg" width="58" height="58" alt="" /> <img src="images/pix6.jpg" width="58" height="58" alt="" /> </div>
      <div class="col c2">
        <h2>InitiateNode</h2>
        <p align="justify">The InitiateNode algorithm takes as input the node identifier u. It outputs several user credentials including (PKu, SKu) and (pku, sku). This process is conducted at user u.</p>
      </div>
      <div class="col c3">
        <h2>Algorithms</h2>
        <img src="images/white.jpg" width="66" height="66" alt="" />
        <p align="justify">Scheme consists of several fundamental algorithms.   adopt either cyphertext policy ABE (CP-ABE) or key policy ABE (KP-ABE) to implement related algorithms.</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <div class="clr"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
