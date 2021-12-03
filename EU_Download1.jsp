<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
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
.style3 {color: #5f5f5f; }
.style18 {font-size: 14px}
.style5 {font-size: 20px}
.style5 {font-size: 14px; font-weight: bold; }
.style7 {font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Main.jsp">End User </a></li>
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
          <h2>Download File </h2>
          <p>&nbsp;</p>
          <form action="EU_Download2.jsp" method="post" id="form1">
            <p><span class="style7">
              <%
			  String role="";
	try 
		{  
		

		
		String file = request.getParameter("t1");
		String user=(String)application.getAttribute("uname");
		String yes="Permitted";
		String trapdoor="",decryptkey="",secretkey="";
		String status="";
		
		String strQuery = "select * from cloudserver where fname='"+file+"'";
		ResultSet rs = connection.createStatement().executeQuery(strQuery);
		if(rs.next()==true)
		{
			trapdoor=rs.getString(4);
			
			if(trapdoor.equalsIgnoreCase("Shared"))
			{
				String ctt=rs.getString(3);
				String keys=rs.getString(9);
				byte[] keyValue1 = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue1,"AES");
				Cipher c1 = Cipher.getInstance("AES");
				c1.init(Cipher.DECRYPT_MODE, key1);
				String fn = new String(Base64.decode(ctt.getBytes()));
				
				String quey1="select * from cloudserver  where fname='"+fn+"' "; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(quey1);
				if ( rs1.next())
				{
					String shared_trapdoor=rs1.getString(4);
					
					
					String Query = "select * from request where fname='"+file+"' and user='"+user+"'";
					ResultSet rs12 = connection.createStatement().executeQuery(Query);
					if(rs12.next()==true)
					{
						secretkey=rs12.getString(5);
						decryptkey=rs12.getString(6);
						
						
						if(decryptkey.equalsIgnoreCase("Requested"))
						{
							%>
							decryptkey Not Authorized By Cloud !</span></p>
							<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
							<p><span class="style7">
							<%
						}
						else if(decryptkey.equalsIgnoreCase("No"))
						{
							%>
							decryptkey Not Requested !</span></p>
							<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
							<p><span class="style7">
							<%
						}
						else
						{
							if(secretkey.equalsIgnoreCase("Requested"))
							{
								%>
								Secret Key Not Permitted ! </span></p>
								<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
								<p><span class="style7">
								<%
							}
							else if(secretkey.equalsIgnoreCase("No"))
							{
								%>
								Secret Key Not Requested !</span></p>
								<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a>
								<%
							}
							else 
							{  
								String dk=rs.getString(9);
								String sk=rs.getString(5);
								%>
								</p>
								<table width="509" style="border-collapse:collapse" cellpadding="0" cellspacing="0" height="241" border="0" align="center">
								<tr>
								<td width="212" height="40"><span class="style5"> File Name :-</span></td>
								<td width="342"><span class="style18">
								<label>
								<input required="required" name="t14" type="text" value="<%=file%>" size="40" />
								</label>
								</span> </td>
								</tr>
								<tr>
								<td height="40"><span class="style5">Trapdoor :-</span></td>
								<td><input name="t122" type="text" value="<%=shared_trapdoor%>" size="40" /></td>
								</tr>
								<tr>
								<td height="40"><span class="style5">Decrypt Key :-</span></td>
								<td><input name="t134" type="text" value="<%=dk%>" size="40" /></td>
								</tr>
								<tr>
								<td height="40"><span class="style5">Secret Key :-</span></td>
								<td><input name="t1343" type="text" value="<%=sk%>" size="40" /></td>
								</tr>
								<tr>
								<td height="40"><div align="right"><span class="style18"></span></div></td>
								<td><span class="style18">
								<label>
								<input type="submit" name="Submit22" value="Download" />
								</label>
								</span> </td>
								</tr>
								</table>
								<p align="right"><a href="EU_Main.jsp">Back</a></p>
								<p class="style7">
								<%
							}
						}
					}
					else
					{
						%>
					  Keys Not Requested !</p>
					<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
					<p class="style7">
					  <%
					}
				}
			}
			else
			{
					String Query = "select * from request where fname='"+file+"' and user='"+user+"'";
			ResultSet rs1 = connection.createStatement().executeQuery(Query);
			if(rs1.next()==true)
			{
				secretkey=rs1.getString(5);
				decryptkey=rs1.getString(6);
				
				
				if(decryptkey.equalsIgnoreCase("Requested"))
				{
					%>
					decryptkey Not Authorized By Cloud !</span></p>
					<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
					<p><span class="style7">
					<%
				}
				else if(decryptkey.equalsIgnoreCase("No"))
				{
					%>
					decryptkey Not Requested !</span></p>
					<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
					<p><span class="style7">
					<%
				}
				else
				{
					if(secretkey.equalsIgnoreCase("Requested"))
					{
						%>
						Secret Key Not Permitted ! </span></p>
						<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
						<p><span class="style7">
						<%
					}
					else if(secretkey.equalsIgnoreCase("No"))
					{
						%>
						Secret Key Not Requested !</span></p>
						<p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a>
						<%
					}
					else 
					{  
						String dk=rs.getString(9);
						String sk=rs.getString(5);
						%>
						</p>
						<table width="509" style="border-collapse:collapse" cellpadding="0" cellspacing="0" height="241" border="0" align="center">
						<tr>
						<td width="212" height="40"><span class="style5"> File Name :-</span></td>
						<td width="342"><span class="style18">
						<label>
						<input required="required" name="t14" type="text" value="<%=file%>" size="40" />
						</label>
						</span> </td>
						</tr>
						<tr>
						<td height="40"><span class="style5">Trapdoor :-</span></td>
						<td><input name="t122" type="text" value="<%=trapdoor%>" size="40" /></td>
						</tr>
						<tr>
						<td height="40"><span class="style5">Decrypt Key :-</span></td>
						<td><input name="t134" type="text" value="<%=dk%>" size="40" /></td>
						</tr>
						<tr>
						<td height="40"><span class="style5">Secret Key :-</span></td>
						<td><input name="t1343" type="text" value="<%=sk%>" size="40" /></td>
						</tr>
						<tr>
						<td height="40"><div align="right"><span class="style18"></span></div></td>
						<td><span class="style18">
						<label>
						<input type="submit" name="Submit22" value="Download" />
						</label>
						</span> </td>
						</tr>
						</table>
						<p align="right"><a href="EU_Main.jsp">Back</a></p>
						<p class="style7">
						<%
					}
				}
			}
			else
			{
				%>
              Keys Not Requested !</p>
            <p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a></p>
            <p class="style7">
              <%
			}
			}
		}		
		else
		{
			%>
              File   Doesn't   Exist ! </h3>
            <p><a href="EU_Main.jsp">Back</a><a href="DU_Main.jsp"></a>
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
          </form>
          <div class="article"></div>
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
            <li><a href="EU_ViewFiles.jsp">View Files</a> </li>
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
