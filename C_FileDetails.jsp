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
<title>Cloud </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style21 {font-size: 14px}
.style23 {color: #666666; font-weight: bold;}
.style32 {font-size: 12px}
.style33 {font-size: 12px; color: #6d6d6d; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
			<li class="active"><a href="C_Login.jsp">Cloud</a></li>
            <li><a href="C_Login.jsp">Logout </a></li>
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
          <h2><span> File Details </span></h2>
          <p>&nbsp;</p>
          <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
String fname=request.getParameter("fname");	
try 
	{
      		String query="Select *from ownerfiles where fname='"+fname+"'"; 
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
					s7=rs.getString(7);
					s8=rs.getString(8);
					s9=rs.getString(9);
				}	

		
						%>
          <table width="549" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="142" height="36"><div align="center" class="style29 style32">
                  <div align="left"><strong> ID :</strong></div>
              </div></td>
              <td width="394"><label>
                <input readonly="readonly"  name="textfield" type="text" value="<%=i%>" size="49" />
                </label>              </td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>File Name : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield2" type="text" size="49" value="<%=s2%>" />              </td>
            </tr>
            <tr>
              <td height="186"><div align="center" class="style33">
                  <div align="left"><strong>Contents :</strong></div>
              </div></td>
              <td><label>
                <textarea readonly="readonly" rows="10"  cols="50"  name="textarea"><%=s3%></textarea>
                </label>              </td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Trapdoor :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield3" type="text" value="<%=s4%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Secret Key  :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield3" type="text" value="<%=s5%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Rank : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield32" type="text" value="<%=s6%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Date &amp; Time :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s7%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Data Owner : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield332" type="text" value="<%=s8%>" size="49" /></td>
			  </tr>
			     <tr>
              <td height="36"><div align="center" class="style33">
                  <div align="left"><strong>Encrypt Key :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s9%>" size="49" /></td>
            </tr>
              <%
			 		
           connection.close();
	  }
	 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
          </table>
          <p>&nbsp;</p>
          <p align="right"><a href="C_FileDeduplication.jsp">Back</a></p>
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
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <ul class="ex_menu"><li></li>
          </ul>
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
