<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="java.lang.String" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Tela de usuário</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<div class="row justify-content-md-center">   
	      <p class="h4">Bem-vindo, usuário <%out.println( request.getParameter("email") ); %></p>
	      <p class="h6">A sua senha é <%out.println( request.getParameter("password")); %></p>
	    </div>
   </div>	
	
</body>
</html>