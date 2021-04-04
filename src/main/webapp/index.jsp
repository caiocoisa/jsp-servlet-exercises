<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="java.lang.String" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Tela de login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-dark bg-light">
	  <div class="container-fluid justify-content-md-center">   
	      <h1 class="display-5 ">Tela de Login</h1>
	  </div>
	</nav>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="card" style="width: 50vw;">
			
			 <ul class="list-group list-group-flush">
			 <li class="list-group-item">
			 
				<div class="card-body">
					<form method="post" action="<%= request.getContextPath()%>/login" >
	  				<div class="row mb-3">
	    				<label for="inputEmail3" class="col-sm-2 col-form-label">E-mail</label>
	    				<div class="col-sm-10">
	      					<input type="email" class="form-control" id="email" name ="email">
	    				</div>
	  				</div>
	  				<div class="row mb-3">
	    				<label for="inputPassword3" class="col-sm-2 col-form-label">Senha</label>
	    				<div class="col-sm-10">
	      					<input type="password" class="form-control" id="password" name="password">
	    				</div>
	  				</div>
	  				<button type="submit" class="btn btn-primary">Entrar</button>
					</form>
				</div>
			</li>
			
			<li class="list-group-item">
					<form method="post" action="newuser.jsp" >
						<button type="submit" class="btn btn-link btn-sm">Esqueceu sua senha?</button>
					</form>
			</li>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<%
			    String erro = request.getParameter("email");
			    if ( erro != null && erro.length() > 0 ) {
			%>
			    <%@include file="error.jsp" %>
			<%
			    }
			%>
		</div>
	</div>
</body>
</html>
