<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            <p></p>
            <form action="EU_ReqDeck1.jsp" method="post" id="leavereply">
              <div align="center">
                <table width="507" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <th height="38" scope="row"><span class="style17 style18">Enter Owner Name :</span></th>
                    <td><span class="style17 style18">
                      <input name="t142" type="text" size="30" />
                    </span></td>
                  </tr>
                  <tr>
                    <th height="43" scope="row"><span class="style17"><span class="style18"> Enter File Name :&nbsp;</span> &nbsp;&nbsp;&nbsp;</span></th>
                    <td><span class="style17">
                      <input name="t14" type="text" size="30" />
                    </span></td>
                  </tr>
                </table>
                <p align="center" class="style17"><br />
                    <br />
                    <input type="submit" name="Submit" value="Request Decrypt Key" />
                </p>
                <p align="right" class="style17">
                  <%/*
	try
	{	  
		  String dname=request.getParameter("t142");
		  String fname=request.getParameter("t14");
		  String user=(String)application.getAttribute("uname");
		  String str="Requested";
		  
		  String query="Select *from request where user='"+user+"' and owner='"+dname+"' and fname='"+fname+"' and fileaccess='"+str+"'";
	      Statement st=connection.createStatement();
          ResultSet rs=st.executeQuery(query);
		  if (rs.next())
		  {
		  		out.println ("<h1>File Access Permission <font>Already Sent</font>!! </h1>");
		  }
		  else
		  {
		  
		  	 String query1="Select * from cloudserver where fname='"+fname+"' and downer='"+dname+"'";	  
			 Statement st1=connection.createStatement();
			 ResultSet rs1=st1.executeQuery(query1);
			 if (rs1.next())
			 {
			
			  	 String query2="Select * from request where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";	  
				 Statement st2=connection.createStatement();
				 ResultSet rs2=st2.executeQuery(query2);
				 if (rs2.next())
				 {
					  String query3="update request set fileaccess='"+str+"' where user='"+user+"' and fname='"+fname+"' and owner='"+dname+"'";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  out.println ("<h1>File Access Permission <font>Sent Sucessfully</font>!! </h1>");
				 }
				 else
				 {
					  String query3="insert into request  (user,owner,fname,fileaccess) values('"+user+"','"+dname+"','"+fname+"','"+str+"')";
					  Statement st3=connection.createStatement();
					  st3.executeUpdate(query3);
					  out.println ("<h1>File Access Permission <font>Sent Sucessfully</font>!! </h1>");
				 }
				  
			  }
			  else
			  {
				
				  out.println ("<h2>File <font>Not Found</font>!!  </h2>");
			  }
		 }
		connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		  */%>
                <a href="EU_Main.jsp">Back</a></p>
              </div>
              <label for="name"></label>
            </form>
            <h3 align="justify">&nbsp;</h3>
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
