<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style3 {color: #5f5f5f; }
.style21 {font-size: 14px}
.style23 {color: #666666; font-weight: bold;}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="DO_Main.jsp">Data Owner </a></li>
			<li><a href="DO_Login.jsp">Logout</a></li>
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
      <div class="article">
        <div class="article">
          <h2><span>Deduplication Log Details </span></h2>
            <p>&nbsp;</p>
            <table width="813" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	
try 
	{		
		
				%>
              <tr>
                <td width="56" height="30"><div align="center" class="style21"><span class="style23"> ID </span></div></td>
                <td width="190"><div align="center" class="style21"><span class="style23">My Duplicate File Name </span></div></td>
                <td width="216"><div align="center" class="style21"><span class="style23">Original File Owner Name </span></div></td>
                <td width="164"><div align="center" class="style21"><span class="style23">Original File Name </span></div></td>
                <td width="175"><div align="center" class="style21"><span class="style23"> Status </span></div></td>
              </tr>
              <%
				String dname=(String)application.getAttribute("doname");
				
				String query="Select *from deduplication_log where current_file_owner='"+dname+"' "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					//String dt1 = new String(Base64.decode(.getBytes()));
					
					%>
              <tr>
                <td height="28"><div align="center"><%=i%></div></td>
                <td><div align="center"><%=s2%></div></td>
                <td><div align="center"><%=s5%></div></td>
                <td><div align="center"><%=s4%></div></td>
                <td><table width="165" height="26" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th scope="row"><div align="center">Shared<!--<form id="form1" name="form1" method="post" action="DO_Delete_dupli.jsp?fname=">
                      <label>
                      <input type="submit" name="Submit2" value="Delete" />
                      </label>
                    </form></div></th>
                    <td><div align="center"><form id="form1" name="form1" method="post" action="DO_Share_dupli.jsp?dup_f=&amp;org_f=">
                      <label>
                      <input type="submit" name="Submit" value="Share" />
                      </label>
                    </form>--></div></td>
                  </tr>
                </table></td>
              </tr>
              <%
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            </table>
            <p>&nbsp;</p>
            <table width="805" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <th scope="row"><div align="right"><a href="DO_Main.jsp">Back</a></div></th>
              </tr>
            </table>
            <p>&nbsp;</p>
          <div class="article"></div>
        </div>
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
