<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style3 {color: #5f5f5f; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
        <li ><a href="index.html">Home</a></li>
            <li class="active"><a href="DO_Login.jsp">Data Owner </a></li>
            <li><a href="EU_Login.jsp">End User </a></li>
			<li><a href="C_Login.jsp">Cloud</a></li>
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
          <h2><span>Data Owner Register </span></h2>
          <p>&nbsp;</p>
          <form action="DO_RegisterAuthentication.jsp" method="post" id="" enctype="multipart/form-data">
            <label for="name"> Data Owner Name (required)<br />
            </label>
            <p>
              <input id="name" name="userid" class="text" />
            </p>
            <label for="password">Password (required)<br />
            </label>
            <p>
              <input type="password" id="password" name="pass" class="text" />
            </p>
            <p>
              <label for="email">Email Address (required)<br />
              </label>
              <input id="email" name="email" class="text" />
            </p>
            <label for="mobile">Mobile Number (required)<br />
            </label>
            <p>
              <input id="mobile" name="mobile" class="text" />
            </p>
            <label for="address">Your Address<br />
            </label>
            <p>
              <textarea name="address" cols="50" id="address"></textarea>
            </p>
            <label for="dob">Date of Birth (required)<br />
            </label>
            <p>
              <input id="dob" name="dob" class="text" />
            </p>
            <label for="gender">Select Gender (required)<br />
            </label>
            <p>
              <select id="s1" name="gender" class="text">
                <option>-Select-</option>
                <option>Male</option>
                <option>Female</option>
              </select>
            </p>
            <label for="pincode">Enter Pincode (required)<br />
            </label>
            <p>
              <input id="pincode" name="pincode" class="text" />
            </p>
            <label for="location">Enter Location (required)<br />
            </label>
            <p>
              <input id="loc" name="location" class="text" />
            </p>
            <label for="pic">Select Profile Picture (required)<br />
            </label>
            <p>
              <input type="file" id="pic" name="pic" class="text" />
            </p>
            <p>
              <input name="submit" type="submit" value="REGISTER" />
            </p>
          </form>
          <p align="right"><a href="DO_Login.jsp">Back</a></p>
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
            <li><a href="C_Login.jsp">Cloud</a></li>
            <li><a href="EU_Login.jsp">End User </a></li>
            <li><a href="DO_Login.jsp">Data Owner </a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
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
