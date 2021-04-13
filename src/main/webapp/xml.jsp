<%@page import="src.com.model.servlet.ServletVoto" %>
<%@page import="src.com.model.controller.Urna" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-wi dth, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Urna Eletronica</title>
  </head>

  <body>
  <div class="container-fluid">		
		<div class="row">	
			<div class="col ml-3">
	
				<% String tab = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; %>
				<% String json = "&lt;?xml version=\"1.0\"&gt;<br>";%>
				  
				  <% json = json.concat("&lt;eleicao&gt<br>"); %>
				  
				  <!-- PREFEITOS -->
					  <% json = json.concat(tab+"&lt;prefeitos&gt<br>"); %>
						  <% for ( Object key:ServletVoto.urna.getBoletimPrefeitos().keySet() ) { %>
						  	<% String nome = ServletVoto.urna.getCandidato((String)key).getNome(); %>
						  	<% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
						  	<% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
						  
						  	<% json = json.concat(tab+tab+"&lt;prefeito&gt<br>"); %>
						  		<% json = json.concat(tab+ tab + tab +"&lt;nome&gt;" + nome + "&lt;/nome&gt;<br>");%>
					      		<% json = json.concat(tab+ tab + tab +"&lt;partido&gt;" + partido + "&lt;/partido&gt;<br>"); %>
					      		<% json = json.concat(tab+ tab + tab +"&lt;votos&gt;" + votos + "&lt;/votos&gt;<br>"); %>
						    <% json = json.concat(tab+tab+"&lt;/prefeito&gt<br>"); %>
						  <%} %>
						  <% json = json.concat(tab+"&lt;/prefeitos&gt<br>"); %>
					  
				  
				  <!-- VEREADORES -->
					  <% json = json.concat(tab+"&lt;vereadores&gt<br>"); %>
					  	<% for ( Object key:ServletVoto.urna.getBoletimVereadores().keySet() ) { %>
					  		<% String nome = ServletVoto.urna.getCandidato((String)key).getNome();%>
					  		<% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
					  		<% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
					  
					  		<% json = json.concat(tab+tab+"&lt;vereador&gt<br>"); %>
						  		<% json = json.concat(tab+ tab + tab +"&lt;nome&gt;" + nome + "&lt;/nome&gt;<br>");%>
					      		<% json = json.concat(tab+ tab + tab +"&lt;partido&gt;" + partido + "&lt;/partido&gt;<br>"); %>
					      		<% json = json.concat(tab+ tab + tab +"&lt;votos&gt;" + votos + "&lt;/votos&gt;<br>"); %>
						    <% json = json.concat(tab+tab+"&lt;/vereador&gt<br>"); %>  
						  <%} %>
						  <% json = json.concat(tab+"&lt;/vereadores&gt<br>"); %>
					  
				  
				  	<% json = json.concat("&lt;/eleicao&gt<br>"); %>
				  <% out.print(json); %>  
			</div>		
		</div>
	</div>
</body>
</html>