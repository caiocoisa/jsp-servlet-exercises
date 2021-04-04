<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Cadastre-se</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-dark bg-light">
	  <div class="container-fluid justify-content-md-center">   
	      <h1 class="display-5 ">Cadastre-se</h1>
	  </div>
	</nav>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="card" style="width: 50vw;">
			
			 <ul class="list-group list-group-flush">
			 <li class="list-group-item">
			 
				<div class="card-body">
					<form method="get" action="<%= request.getContextPath()%>/register" >
	  				<div class="row mb-3">
	    				<label for="inputEmail3" class="col-sm-4 col-form-label">Insira seu E-mail</label>
	    				<div class="col-sm-8">
	      					<input type="email" class="form-control" id="email" name ="email">
	    				</div>
	  				</div>
	  				<div class="row mb-3">
	    				<label for="inputPassword3" class="col-sm-4 col-form-label">Insira sua senha</label>
	    				<div class="col-sm-8">
	      					<input type="password" class="form-control" id="password" name="password">
	    				</div>
	  				</div>
	  				<div class="row mb-3">
	    				<label for="inputPassword3" class="col-sm-4 col-form-label">Repita sua senha</label>
	    				<div class="col-sm-8">
	      					<input type="password" class="form-control" id="repassword" name="repassword">
	    				</div>
	  				</div>
	  				<button type="submit" class="btn btn-primary" >Salvar</button>
					</form>
				</div>
			</li>
			
			<li class="list-group-item">
					<form method="post" action="index.jsp" >
						<button type="submit" class="btn btn-outline-secondary">Voltar</button>
					</form>
			</li>
			</div>
		</div>

	</div>
</body>
</html>
