<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ page import="java.lang.String" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Jogo da Velha</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
<%
	session.setAttribute("turno", "X");
%>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#273339;" >
	  	<div class="container-fluid">
	    	<span class="navbar-brand mb-0 h1">Jogo da velha</span>
	    </div>
	</nav>
	<div class="container-fluid bg-secondary bg-gradient" style="padding:10vh;">
		<div class="row justify-content-md-center">
			
			<div class="col-md-4 col-12" style="background-color: #dddddd;">
				<div class="row justify-content-md-center" style="padding:30px;">
					<% if ( request.getAttribute("turno") == null ) { %>
					<div class="col">
						<p class="h5">Aperte para começar!</p>
					</div>
					<% } else { %>
					
					<div class="col">
						<p class="h5">É a vez do <% out.println( request.getAttribute("turno") ); %></p>
					</div>
					<% } %>
					
					<% if ( request.getAttribute("winner") != null ) { %>
						<div class="col">
							<p class="h3"><br>Jogador <% out.println( request.getAttribute("turno") ); %> venceu!</p>
						</div>
					<% } %>	
				</div>
				<div class="row justify-content-md-center" style="padding:2.8rem;">
					<form method="get" action="<%= request.getContextPath()%>/jogar">
						<button class="btn btn-primary btn-lg" type="submit" value="init">Iniciar</button>
				</div>
			</div>
			
			<div class="col-md-8 col-12" style="background-color: #273339; padding:1.8rem;">
				<div class="row justify-content-md-center">
					<div class="card" style="width:40vw; height:40vh; padding:2rem;">
					<% if ( request.getAttribute("turno") == null) { %>
						<p>Aperte 'iniciar'</p>
					<% } else { %>	
						<form method="get" action="<%= request.getContextPath()%>/jogar">
							<div class="row">
								<div class="col-4">
							    	<div class="d-grid gap-2">
										<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=0><% out.println( request.getAttribute("0") ); %></button>
				  						<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=3><% out.println( request.getAttribute("3") ); %></button>
				  						<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=6><% out.println( request.getAttribute("6") ); %></button>
									</div>
							    </div>
							    <div class="col-4">
							    	<div class="d-grid gap-2">
										<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=1><% out.println( request.getAttribute("1") ); %></button>
				  						<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=4><% out.println( request.getAttribute("4") ); %></button>
				  						<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=7><% out.println( request.getAttribute("7") ); %></button>
									</div>
							    </div>
							    <div class="col-4">
							    	<div class="d-grid gap-2">
							    		<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=2><% out.println( request.getAttribute("2") ); %></button>
										<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=5><% out.println( request.getAttribute("5") ); %></button>
				  						<button class="btn btn-outline-success btn-lg" type="submit" name="marcar" value=8><% out.println( request.getAttribute("8") ); %></button>  						
									</div>
							    </div>
					    	</div>
					    </form>
				    <% } %>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
