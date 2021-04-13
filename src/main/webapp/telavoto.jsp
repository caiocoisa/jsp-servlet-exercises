<%@page import="src.com.model.servlet.ServletVoto" %>
<%@page import="src.com.model.controller.Urna" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Urna Eletronica</title>
  </head>

  <body class="bg-light" >
  
	<div class="container-fluid p-5" style="background-color:#018bd4; height:80vh;">
	
		<div class="row border border-light border-2">
			<div class="col-sm-6 p-5 bg-light border border-5">
			<% if ( ServletVoto.etapa == 1 ) { %>
				<p class="h1 text-center">Vereador</p>
			<% }else{ %>
				<p class="h1 text-center">Prefeito</p>
			<% } %>
				<div class="row">
			<!-- 		<div class="col-md-4 order-md-2 py-2">
						<div class="card border border-dark bg-info">
							<img src="../../src/src/com/img/image.jpeg" class="card-img-top" alt="">
							<div class="card-body">
							    <p class="card-text">Some quick example</p>
	 				 		</div>
						</div>
					</div>
					
					<li class="list-group-item display-6 list-group-item-info">1</li>
				 -->	
					<div class="col-md-8 order-md-1 py-4 my-2">	
						
						
					
						<ul class="list-group list-group-horizontal-md">
						  <li class="list-group-item display-6 <%if(ServletVoto.getDigito(1)!="_"){ %>list-group-item-dark<%} %>"><%= ServletVoto.getDigito(1) %></li>
						  <li class="list-group-item display-6 <%if(ServletVoto.getDigito(2)!="_"){ %>list-group-item-dark<%} %>"><%= ServletVoto.getDigito(2) %></li>
					  <% if ( ServletVoto.etapa == 1 ) { %>
						  <li class="list-group-item display-6 <%if(ServletVoto.getDigito(3)!="_"){ %>list-group-item-dark<%} %>"><%= ServletVoto.getDigito(3) %></li>
						  <li class="list-group-item display-6 <%if(ServletVoto.getDigito(4)!="_"){ %>list-group-item-dark<%} %>"><%= ServletVoto.getDigito(4) %></li>
						  <li class="list-group-item display-6 <%if(ServletVoto.getDigito(5)!="_"){ %>list-group-item-dark<%} %>"><%= ServletVoto.getDigito(5) %></li>
					  <% }%>
						</ul> 

						<div class="row my-3 ">
							<p class="h3">Nome: <%= ServletVoto.nomeEmVotacao %></p>
						</div>
						<div class="row my-2 ">
							<p class="h5">Legenda: <%= ServletVoto.partidoEmVotacao %></p>
						</div>
					</div>
					
				</div>
			</div>

			<div class="col-sm-6 p-4 bg-secondary-gradient" style="background-color:#019ddf;">
				<form class="row" method="post" action="<%= request.getContextPath() %>/votar" >
					<div class="btn-group mb-3" role="group">
					  <input type="submit" name="btn-1" value="1" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-2" value="2" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-3" value="3" class="btn btn-outline-light btn-lg">
					</div>
					<div class="btn-group mb-3" role="group">
					  <input type="submit" name="btn-4" value="4" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-5" value="5" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-6" value="6" class="btn btn-outline-light btn-lg">
					</div>
					<div class="btn-group mb-3" role="group">
					  <input type="submit" name="btn-7" value="7" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-8" value="8" class="btn btn-outline-light btn-lg">
					  <input type="submit" name="btn-9" value="9" class="btn btn-outline-light btn-lg">
					</div>
					<div class="d-grid gap-2 col-4 mb-3 mx-auto">
  					  <input type="submit" name="btn-0" value="0" class="btn btn-outline-light btn-lg">
					</div>
					<div class="btn-group mb-1" role="group">
					  <button type="submit" name="branco" value="branco" class="btn btn-light border btn-lg">BRANCO</button>
					  <button type="submit" name="corrige" value="corrige" class="btn btn-outline btn-lg" style="background-color:#d45035">CORRIGE</button>
					  <button type="submit" name="confirmar" value="confirma" class="btn btn-success btn-lg" <% if(request.getAttribute("confirma") == null) {%>disabled<%} %>>CONFIRMA</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-11"></div>
			 <% if ( ServletVoto.etapa == 1 ) { %>
			<form class="col-1 text-center " method="post" action="boletim.jsp" >
				<input class="btn btn-outline-light mt-2 rounded-circle" value="" type="submit">
			</form>
			<%} %>
		</div>
	</div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>