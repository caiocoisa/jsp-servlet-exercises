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
  
	<div class="container-fluid">
				
		<div class="row">	
			<div class="col ml-3">
				<% String tab = "&nbsp;&nbsp;&nbsp;&nbsp;"; %>
				<% String json = "{"+"<br>" + tab; %>
				  
				  <% json = json.concat("\"prefeitos\": ["); %>
				  
				  
					  <% for ( Object key:ServletVoto.urna.getBoletimPrefeitos().keySet() ) { %>
					  	<% String nome = ServletVoto.urna.getCandidato((String)key).getNome(); %>
					  	<% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
					  	<% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
					  
					  	<% json = json.concat(tab+"{\n<br>"); %>
					  		<% json = json.concat( tab + tab +"\"nome\": \"" + nome + "\",<br>");%>
				      		<% json = json.concat( tab + tab +"\"partido\": \"" + partido + "\",<br>"); %>
				      		<% json = json.concat( tab + tab +"\"votos\":" + votos + "<br>"); %>
					    <% json = json.concat(tab+"},<br>"); %>  
					  <%} %>
					  <% json = json.substring(0, json.length()-5).concat("<br>],<br>"); %>
				  
				  
				  <% json = json.concat("\"vereadores\": ["); %>
				  	<% for ( Object key:ServletVoto.urna.getBoletimVereadores().keySet() ) { %>
				  		<% String nome = ServletVoto.urna.getCandidato((String)key).getNome();%>
				  		<% String partido = ServletVoto.urna.getCandidato((String)key).getPartido(); %>
				  		<% String votos = ServletVoto.urna.getVotosByNumero( (String) key); %>
				  
				  		<% json = json.concat(tab+"{\n<br>"); %>
					  		<% json = json.concat( tab + tab +"\"nome\": \"" + nome + "\",<br>");%>
				      		<% json = json.concat( tab + tab +"\"partido\": \"" + partido + "\",<br>"); %>
				      		<% json = json.concat( tab + tab +"\"votos\":" + votos + "<br>"); %>
					    <% json = json.concat(tab+"},<br>"); %>  
					  <%} %>
					  <% json = json.substring(0, json.length()-5).concat("<br>],<br>"); %>
				  
				  <% json = json.substring(0, json.length()-5).concat("<br>}<br>"); %>
				  	
				  <% out.print(json); %>  
			</div>		
		</div>
	</div>
</body>
</html>