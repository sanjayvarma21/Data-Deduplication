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
.style14 {color: #0e4369; font-size: 16px; font-weight: bold; }
.style16 {font-size: 12px}
.style30 {color: #000000}
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
          <p>&nbsp;</p>
          <p>
            <%
	try 
	{
		String file=request.getParameter("t422");
		String keys=request.getParameter("tt23");
		String cont=request.getParameter("text2");
		String mac =request.getParameter("t4");
		
		String dname=(String)application.getAttribute("doname");
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		
		byte[] keyValue = keys.getBytes();
		Key key = new SecretKeySpec(keyValue, "AES");
		Cipher c = Cipher.getInstance("AES");
		c.init(Cipher.ENCRYPT_MODE, key);
		String dt1 = new String(Base64.encode(dt.getBytes()));
		
	    KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();
		Key pubKey = kp.getPublic();
		byte[] pub = pubKey.getEncoded();
		String pk = String.valueOf(pub); 
		
		String rank="0";
		
		Statement st=connection.createStatement();
		String task="Upload";
		
		String strQuery2 = "insert into transaction(user,fname,task,dt) values('"+dname+"','"+file+"','"+task+"','"+dt+"')";
		st.executeUpdate(strQuery2);
		
		String sch="Schedule";
		
		st.executeUpdate("insert into  encryptkey(downer,fname,enkey,dt) values ('"+dname+"','"+file+"','"+keys+"','"+dt+"')");
		
	    st.executeUpdate("insert into  cloudserver(fname,ct,trapdoor,sk,rank,dt,downer,enckey,dupli_check) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+dname+"','"+keys+"','No')"); 
				
		st.executeUpdate("insert into  ownerfiles(fname,ct,trapdoor,sk,rank,dt,downer,enckey) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+dname+"','"+keys+"')"); 		
		%>
		</p>
		<h3 class="style30">File Uploaded Sucessfully !</h3>
		<p class="style30">&nbsp;</p>
		</p>
		<a href="DO_Main.jsp">Back</a><br />
		<%
		
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
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
