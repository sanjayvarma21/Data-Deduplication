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
.style9 {font-size: 16px;
	font-weight: bold;
}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
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
        <h1>Seure Data Deduplication in Cloud</h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Download File </h2>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <div class="entry">
            <p align="center" class="style9">
              <%
		  	
			try 
			{
		  		String file = request.getParameter("t14");
				String trapdoor=request.getParameter("t122");
				String dk=request.getParameter("t134");
				String sk=request.getParameter("t1343");
				String user=(String)application.getAttribute("uname");
				
				
				String ct="",dk1="",sk1="";
				String str="Attacked";
				
				
					String strQuery1 = "select * from cloudserver where fname='"+file+"' ";//and trapdoor='"+trapdoor+"'";
					ResultSet rs = connection.createStatement().executeQuery(strQuery1);
					if(rs.next()==true)
					{
					
						String c_trapdoor=rs.getString(4);
						if (c_trapdoor.equalsIgnoreCase("Shared"))
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
								if(shared_trapdoor.equalsIgnoreCase(trapdoor))
								{
									String strQuery2 = "select * from request where fname='"+file+"' and  user='"+user+"'";
							ResultSet rs2 = connection.createStatement().executeQuery(strQuery2);
							if(rs2.next()==true)
							{
								ct=rs1.getString(3);
								dk1=rs1.getString(9);
								sk1=rs.getString(5);


								if(dk1.equalsIgnoreCase(dk))
								{
										if(sk1.equalsIgnoreCase(sk))
										{
							
											String rank=rs.getString(6);
											
											int updaterank = Integer.parseInt(rank)+1;
											String strQuer = "update cloudserver set rank='"+updaterank+"' where fname='"+file+"'";
											connection.createStatement().executeUpdate(strQuer);
											
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
											Date now = new Date();
						
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;	
											
											
											String task="Download";
											String Query2 = "insert into transaction(user,fname,task,dt) values('"+user+"','"+file+"','"+task+"','"+dt+"')";
											connection.createStatement().executeUpdate(Query2);
											
											
											String keys1=rs1.getString(9);
											byte[] keyValue11 = keys1.getBytes();
											Key key11 = new SecretKeySpec(keyValue11,"AES");
											Cipher c11 = Cipher.getInstance("AES");
											c11.init(Cipher.DECRYPT_MODE, key11);
											String decryptedValue = new String(Base64.decode(ct.getBytes()));
											%>
              File Contents</p>
            <label>
            <div align="center">
              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
              <br/>
              <br/>
              <td><button onclick="saveTextAsFile()">Download</button>
                  <p align="right"><a href="EU_Main.jsp">Back</a></p></td>
            </div>
            </label>
            <h3>
              <%
										}
										else
										{
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
											Date now = new Date();
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;
											
											
										String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','Secret Key Attack')";
											connection.createStatement().executeUpdate(strQuer1);
										
											%>
            Secret Key Mismatch !!!
            </h3>
            <p><a href="EU_Main.jsp">Back</a></p>
            <h3>
              <%
								 		}			
									
									
								}
								else
								{
									SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
									SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
									Date now = new Date();
									String strDate = sdfDate.format(now);
									String strTime = sdfTime.format(now);
									String dt = strDate + "   " + strTime;
									
				
									String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+dk+"','"+dt+"','Content Key Attack')";
									connection.createStatement().executeUpdate(strQuer1);
								
									%>
            Decrypt Key Mismatch !!!
            </h3>
            <p><a href="EU_Main.jsp">Back</a></p>
            <h3>
              <%
								}
							}
								}			
								else
								{
									SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
									SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
									Date now = new Date();
									String strDate = sdfDate.format(now);
									String strTime = sdfTime.format(now);
									String dt = strDate + "   " + strTime;
								String strQuer2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+trapdoor+"','"+dt+"','Trapdoor Missmatch')";
									connection.createStatement().executeUpdate(strQuer2);
									%>
									Trapdoor Mismatch !!! <br />
									</span>
									</h3>
									</h3>
									<p><a href="EU_Main.jsp">Back</a></p>
									<%
								}
							}	
								
						}
						else
						{
							String ctrapdoor=rs.getString(4);

							if(ctrapdoor.equalsIgnoreCase(trapdoor))
							{
							
								String strQuery2 = "select * from request where fname='"+file+"' and  user='"+user+"'";
							ResultSet rs2 = connection.createStatement().executeQuery(strQuery2);
							if(rs2.next()==true)
							{
								ct=rs.getString(3);
								dk1=rs.getString(9);
								sk1=rs.getString(5);


								if(dk1.equalsIgnoreCase(dk))
								{
										if(sk1.equalsIgnoreCase(sk))
										{
							
											String rank=rs.getString(6);
											
											int updaterank = Integer.parseInt(rank)+1;
											String strQuer = "update cloudserver set rank='"+updaterank+"' where fname='"+file+"'";
											connection.createStatement().executeUpdate(strQuer);
											
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
											Date now = new Date();
						
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;	
											
											
											String task="Download";
											String Query2 = "insert into transaction(user,fname,task,dt) values('"+user+"','"+file+"','"+task+"','"+dt+"')";
											connection.createStatement().executeUpdate(Query2);
											
											
											String keys=rs.getString(9);
											byte[] keyValue1 = keys.getBytes();
											Key key1 = new SecretKeySpec(keyValue1,"AES");
											Cipher c1 = Cipher.getInstance("AES");
											c1.init(Cipher.DECRYPT_MODE, key1);
											String decryptedValue = new String(Base64.decode(ct.getBytes()));
											%>
              File Contents</p>
            <label>
            <div align="center">
              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
              <br/>
              <br/>
              <td><button onclick="saveTextAsFile()">Download</button>
                  <p align="right"><a href="EU_Main.jsp">Back</a></p></td>
            </div>
            </label>
            <h3>
              <%
										}
										else
										{
											SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
											Date now = new Date();
											String strDate = sdfDate.format(now);
											String strTime = sdfTime.format(now);
											String dt = strDate + "   " + strTime;
											
											
										String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','Secret Key Attack')";
											connection.createStatement().executeUpdate(strQuer1);
										
											%>
            Secret Key Mismatch !!!
            </h3>
            <p><a href="EU_Main.jsp">Back</a></p>
            <h3>
              <%
								 		}			
									
									
								}
								else
								{
									SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
									SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
									Date now = new Date();
									String strDate = sdfDate.format(now);
									String strTime = sdfTime.format(now);
									String dt = strDate + "   " + strTime;
									
				
									String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+dk+"','"+dt+"','Content Key Attack')";
									connection.createStatement().executeUpdate(strQuer1);
								
									%>
            Decrypt Key Mismatch !!!
            </h3>
            <p><a href="EU_Main.jsp">Back</a></p>
            <h3>
              <%
								}
							}
							
							}			
							else
							{
								SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
								SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
								Date now = new Date();
								String strDate = sdfDate.format(now);
								String strTime = sdfTime.format(now);
								String dt = strDate + "   " + strTime;
							String strQuer2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+trapdoor+"','"+dt+"','Trapdoor Missmatch')";
								connection.createStatement().executeUpdate(strQuer2);
								%>
								Trapdoor Mismatch !!! <br />
								</span>
								</h3>
								</h3>
								<p><a href="EU_Main.jsp">Back</a></p>
								<%
							}
						
						}
								
					}
        	connection.close();
	  } 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
          </div>
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
