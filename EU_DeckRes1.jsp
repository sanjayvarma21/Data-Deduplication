<title>Authentication Page</title>
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
<%
   	String fname=request.getParameter("t14");      
   	String uname=(String)application.getAttribute("uname");
	String key="";
	try
	{
		String sql1="SELECT * FROM cloudserver where fname='"+fname+"'";
		Statement stmt1 = connection.createStatement();
		ResultSet rs1 =stmt1.executeQuery(sql1);
		if(rs1.next())
		{
			String sql="SELECT * FROM request where user='"+uname+"' and fname='"+fname+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			if(rs.next())
			{
				key=rs.getString(6);
				if (key.equalsIgnoreCase("No"))
				{
					key=" Decrypt Key Not Requested !!";
					application.setAttribute("key",key);
					response.sendRedirect("EU_DeckRes.jsp");
				}
				else if (key.equalsIgnoreCase("Requested"))
				{
					key=" Decrypt Key Not Authorized !!";
					application.setAttribute("key",key);
					response.sendRedirect("EU_DeckRes.jsp");
				}
				
				else 
				{
					application.setAttribute("key",key);
					response.sendRedirect("EU_DeckRes.jsp");
				}
			}
			else
			{
				key="Decrypt Key Not Requested !!";
				response.sendRedirect("EU_DeckRes.jsp");
				application.setAttribute("key",key);
			}
		
		}
		else
		{
			key="File Not Found !!";
			response.sendRedirect("DU_FileAccessRes.jsp");
			application.setAttribute("key",key);
		}
	}
	catch(Exception e)
	{
	out.print(e);
	}
%>