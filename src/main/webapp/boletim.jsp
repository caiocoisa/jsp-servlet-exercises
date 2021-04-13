<%@page import="src.com.model.servlet.ServletVoto" %>
<%@page import="src.com.model.controller.Urna" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
	<div class="container-fluid p-5" style="background-color:#018bd4;">
		<p class="h2">Boletim da Urna</p>
				
		<div class="row border border-light border-2">
			<p class="h4 text-center text-light pt-2">Prefeito</p>	
			<div class="col-8 col-md-8 offset-md-2">
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Nome</th>
				      <th scope="col">Partido</th>
				      <th scope="col">Votos</th>
				    </tr>
				  </thead>
				  <tbody>
				  <% for ( Object key:ServletVoto.urna.getBoletimPrefeitos().keySet() ) { %>
				  <% String nome = ServletVoto.urna.getCandidato((String)key).getNome(); %>
				  <% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
				  <% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
				    <tr>
				      <td scope="row"><%= nome %></td>
				      <td scope="row"><%= partido %></td>
				      <td scope="row"><%= votos %></td>
				    </tr>
				    <%} %>
				    <tr class="text-light">
				      <td scope="row">Brancos</td>
				      <td scope="row"></td>
				      <td colspan="2"><%= ServletVoto.urna.getVotosBrancoPrefeito() %></td>				      
				    </tr>
				  </tbody>
				</table>
			</div>		
		</div>
		
		
		<div class="row border border-light border-2 mt-3">
			<p class="h4 text-center text-light pt-2">Vereador</p>	
			<div class="col-8 col-md-8 offset-md-2">
				<table class="table table-striped table-hover">
				  <thead>
				    <tr>
				      <th scope="col">Nome</th>
				      <th scope="col">Partido</th>
				      <th scope="col">Votos</th>
				    </tr>
				  </thead>
				  <tbody>
				  <% for ( Object key:ServletVoto.urna.getBoletimVereadores().keySet() ) { %>
				  <% String nome = ServletVoto.urna.getCandidato((String)key).getNome(); %>
				  <% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
				  <% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
				    <tr>
				      <td scope="row"><%= nome %></td>
				      <td scope="row"><%= partido %></td>
				      <td scope="row"><%= votos %></td>
				    </tr>
				    <%} %>
				    <tr class="text-light">
				      <td scope="row">Brancos</td>
				      <td scope="row"></td>
				      <td colspan="2"><%= ServletVoto.urna.getVotosBrancoPrefeito() %></td>				      
				    </tr>
				  </tbody>
				</table>
			</div>		
		</div>
		
		
		<div class="row border border-light border-2 mt-3">
			<p class="h4 text-center text-light pt-2">Partidos</p>	
			<div class="col-8 col-md-8 offset-md-2">
				<table class="table table-striped table-hover">
				  <thead>
				    <tr>
				      <th scope="col">Partido</th>
				      <th scope="col">Votos</th>
				    </tr>
				  </thead>
				  <tbody>
				  <% for ( Object key:ServletVoto.urna.getBoletimVereadores().keySet() ) { %>
				  <% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
				  <% String votos = ServletVoto.urna.getVotosByPartido( (String) key  ); %>
				    <tr>
				      <td scope="row"><%= partido %></td>
				      <td scope="row"><%= votos %></td>
				    </tr>
				    <%} %>
				  </tbody>
				</table>
			</div>		
		</div>
		
		<form class="row mt-3" method="post" action="<%= request.getContextPath() %>/votar" >
			<input class="btn btn-outline-light" value="voltar" type="submit">
		</form>	
	</div>
</body>
</html>