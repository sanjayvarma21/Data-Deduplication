<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

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
.style28 {font-size: 16px;
	font-weight: bold;
}
.style3 {font-size: 12px}
.style31 {font-size: 18px}
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
        <h1>Seure Data Deduplication in Cloud</h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Request Secret Key  </span></h2>
          <p>&nbsp;</p>
          <p>
            <%
try
{
	
	String owner = request.getParameter("t142");
	String fname = request.getParameter("t14");
	String uname=(String)application.getAttribute("uname");
	String generate ="Requested",sk="";
	
	SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
	
	
		String query1="select * from cloudserver  where fname='"+fname+"' and downer='"+owner+"' "; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		if ( rs1.next())
		{
		
			String duplcheck=rs1.getString(10);
			if (duplcheck.equalsIgnoreCase("Verified")||duplcheck.equalsIgnoreCase("Shared"))
			{
			String query="select * from request  where user='"+uname+"' and fname='"+fname+"' and owner='"+owner+"' "; 
			Statement st=connection.createStatement();
			ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true)
			{
			
				sk=rs.getString(5);
				if(sk.equalsIgnoreCase("Requested"))
				{
					%>
</p>
          <h2 class="style31">Request Already Sent To Data Owner!</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <%
				}
				else if(sk.equalsIgnoreCase("No"))
				{
					String query3="update request set secretkey='Requested' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
					connection.createStatement().executeUpdate(query3);
					
					%>
          <h2 class="style31">Request Sent To Data Owner !</h2>
          <p><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <%
				}
				else
				{
					%>
          <h2 class="style31">Request Already Sent To Data Owner !</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <%
				}		
			}
			else
			{
			
			
			
String query4="insert into request(user,owner,fname,secretkey,decryptkey) values('"+uname+"','"+owner+"','"+fname+"','Requested','No')";
				connection.createStatement().executeUpdate(query4); 
				%>
          <h2 class="style31">Request Sent To Data Owner !</h2>
          <p class="style28"><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p class="style28">
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
          </p>
          <h2 class="style31">File Doesn't Exist / File Is Not Verified By Cloud ! </h2>
          <p><a href="EU_SecretKey.jsp" class="style3">Back</a></p>
          <p>
            <%
		}
		
	connection.close();
} 
catch(Exception e)
{
out.println(e.getMessage());
}
	%>
          </p>
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
