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
.style14 {color: #0e4369; font-size: 16px; font-weight: bold; }
.style16 {font-size: 12px}
.style13 {font-size: 12px;
	color: #504b4b;
}
.style17 {color: #FF0000}
.style18 {color: #CC3300}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("fileupload").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
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
        <h1>Seure Data Deduplication in Cloud<br /></h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Select File To Upload </span></h2>
            <p>
              <%
  try {
			String filename=request.getParameter("t42");
      		String file=request.getParameter("tt");
      		String keys=request.getParameter("tt2");
      		String cont=request.getParameter("text");
			
			application.setAttribute("file1",file);
			String dname=(String)application.getAttribute("doname");
			
			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(cont.getBytes()));

			String namefile=request.getRealPath("file");
      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(cont));
      		String h1="";
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
			String query="Select *from cloudserver where fname='"+file+"' "; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true )
			{
				String fi1=rs.getString(2);
				%>
				<h3 class="style30 style17">Cloud Response:</h3>
				<h3 class="style30"> A File With Same Name Exists Already !</h3>
				<p class="style30 style17"><em><strong>Key-In Different File Name To Continue</strong></em>.</p>
				<a href="DO_Upload.jsp">Back</a><br />
				<%
			}
			else
			{
				String query1="Select *from cloudserver where trapdoor='"+h1+"' ";//and downer='"+dname+"'"; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
				if ( rs1.next()==true )
				{
					String owner=rs1.getString(8);
					String fi=rs1.getString(2);
					//out.print(owner);
					if(owner.equalsIgnoreCase(dname))
					{
						%>
						<h3 class="style30 style17">Cloud Response:</h3>
						<h3 class="style30">You Have Already Uploaded " <%=fi%> " With Same Contents !</h3>
						<p class="style30">&nbsp;</p>
						<a href="DO_Upload.jsp">Back</a><br />
						<%
					}
					else
					{
						%>
				<h3 class="style30 style18">The File Uploaded By You Seems To Be Duplicate !</h3>
		<p class="style30">You Can Either <a href="DO_Share_dupli.jsp?org_f=<%=fi%>&amp;dup_f=<%=file%>">Share</a>File With Original File DataOwner(<%=owner%>) Or <a href="DO_Upload.jsp">Cancel</a> Uploading</p>
						<p class="style30 style18">(OR) </p>
						<form id="form1" name="form1" method="post" action="DO_Upload2.jsp">
						<table width="545" border="0" align="center" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
						<tr>
						<td width="210" height="36"><span class="odd style13"><strong>File Name : </strong> </span></td>
						<td width="319"><input name="t422" type="text" id="t422" size="49" value="<%= file %>" readonly="readonly" /></td>
						</tr>
						<tr>
						<td height="43" class="odd style14 style28"><span class="odd style11 style16">Encrypt Key  :</span></td>
						<td><input required="required"  name="tt23" value="<%=keys%>" type="text" id="tt" size="49"/></td>
						</tr>
						<tr>
						<td height="257">&nbsp;</td>
						<td><textarea name="text2" id="textarea2" cols="50"  rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
						</tr>
						<tr>
						<td height="35"><span class="odd style13"><strong>Trapdoor : </strong></span></td>
						<td><input name="t4" type="text" id="t4" size="49" value="<%= h1 %>" readonly="readonly" />
						<input name="status"  type="hidden"  value="Duplicate" /></td>
						</tr>
						<tr>
						<td><div align="right"> </div></td>
						<td><input type="submit" name="Submit" value="Continue Uploading Anyway" /></td>
						</tr>
						</table>
						</form>
						<p>
						</label>
		  <div align="right"><a href="DO_Upload.jsp">Back</a></div>
						    <%
					}
				}
				else
				{
					
						%>
		  
						<form id="form1" name="form1" method="post" action="DO_Upload2.jsp">
						<table width="545" border="0" align="center" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
						<tr>
						<td width="210" height="36"><span class="odd style13"><strong>File Name : </strong> </span></td>
						<td width="319"><input name="t422" type="text" id="t422" size="49" value="<%= file %>" readonly="readonly" /></td>
						</tr>
						<tr>
						<td height="43" class="odd style14 style28"><span class="odd style11 style16">Encrypt Key  :</span></td>
						<td><input required="required"  name="tt23" value="<%=keys%>" type="text" id="tt" size="49"/></td>
						</tr>
						<tr>
						<td height="257">&nbsp;</td>
						<td><textarea name="text2" id="textarea2" cols="50"  rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
						</tr>
						<tr>
						<td height="35"><span class="odd style13"><strong>Trapdoor : </strong></span></td>
						<td><input name="t4" type="text" id="t4" size="49" value="<%= h1 %>" readonly="readonly" />
						<input name="status"  type="hidden"  value="Verified" /></td>
						</tr>
						<tr>
						<td><div align="right"> </div></td>
						<td><input type="submit" name="Submit" value=" Upload" /></td>
						</tr>
						</table>
						</form>
						<p>
						
						
						</label>
						<div align="right"><a href="DO_Upload.jsp">Back</a></div>
						    <%
					}
			 }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
			                </p>
		               
						<p>&nbsp;</p>
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
            <li><a href="DO_Main.jsp">Home</a></li>
            <li><a href="DO_Login.jsp">Logout</a></li>
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
