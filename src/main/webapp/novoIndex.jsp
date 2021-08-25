<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 10/07/2021
  Time: 01:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
  <!--BOOTSTRAP5.1-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!--CSS-->
  <link href="css/style.css" rel="stylesheet"/>
  <!--TITLE-->
  <title>Home</title>
  <!--SCRIPTS-->
  <!--JQUERY-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!--BOOTSTRAP JS-->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <!--ARQUIVO DA API PROGRESS BAR LINK->https://kimmobrunfeldt.github.io/progressbar.js/ -->
  <script src="progressbar.min.js"></script>


</head>
<body class="home-body">
  <jsp:include page="header.jsp"/>
  <section>
    <div class="container mt-5 mb-3">
      <div class="row mb-5 gap-5 d-flex justify-content-center">
        <div class="col-sm-5">
          <div class="card border-dark" >
            <img src="resources/cliente.jpg" height="300" class="card-img-top" alt="...">
            <div class="card-body card-bg">
              <h5 class="card-title text-primary">Clientes</h5>
              <p class="card-text text-primary">Clique aqui para cadastrar clientes!</p>
              <a href="cliente-controller" class="btn btn-outline-primary">Cadastrar Clientes</a>
            </div>
          </div>
        </div>
        <div class="col-sm-5">
          <div class="card border-dark">
            <img src="resources/produto.jpg" height="300" class="card-img-top" alt="...">
            <div class="card-body card-bg">
              <h5 class="card-title text-primary">Produtos</h5>
              <p class="card-text text-primary">Clique aqui para cadastrar produtos!</p>
              <a href="produto-controller" class="btn btn-outline-primary">Cadastrar Produtos</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row mb-5 gap-5 d-flex justify-content-center">
        <div class="col-sm-5">
          <div class="card border-dark">
            <img src="resources/vendedor.jpg" height="300" width="250" class="card-img-top" alt="...">
            <div class="card-body card-bg">
              <h5 class="card-title text-primary">Vendedores</h5>
              <p class="card-text text-primary">Clique aqui para cadastrar vendedores!</p>
              <a href="vendedor-controller" class="btn btn-outline-primary">Cadastrar Vendedores</a>
            </div>
          </div>
        </div>
        <div class="col-sm-5">
          <div class="card border-dark">
            <img src="resources/compra.jpg" height="300" class="card-img-top" alt="Compras">
            <div class="card-body card-bg">
              <h5 class="card-title text-primary">Compras</h5>
              <p class="card-text text-primary">Clique aqui para registrar compras!</p>
              <a href="compra-controller" class="btn btn-outline-primary">Registrar Compras</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer id="data-area" class="bg-dark">
    <div class="container">
      <div class="row">
        <div class="col-md-3 circle-box">
          <div id="circleA">
            <p>Vendedores</p>
            <input type="hidden" id="numVendedores" value="${numVendedores}">
          </div>
        </div>
        <div class="col-md-3 circle-box">
          <div id="circleB">
            <p>Clientes</p>
            <input type="hidden" id="numClientes" value="${numClientes}">
          </div>
        </div>
        <div class="col-md-3 circle-box">
          <div id="circleC">
            <p>Produtos</p>
            <input type="hidden" id="numProdutos" value="${numProdutos}">
          </div>
        </div>
        <div class="col-md-3 circle-box">
          <div id="circleD">
            <p>Compras</p>
            <input type="hidden" id="numCompras" value="${numCompras}">
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!--SCRIPT PROGRESS BAR (JQUERY)-->
  <script src="scriptProgressBar.js" type="text/javascript"></script>
</body>
</html>
