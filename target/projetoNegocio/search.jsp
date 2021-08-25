<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 23/08/2021
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Pesquisa</title>
    <!--BOOTSTRAP5.1-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!--CSS-->
    <link href="css/style.css" rel="stylesheet"/>
    <!--BOOTSTRAP JS-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <section>
        <div class="container">
            <div class="row mt-4">
                <div class="col d-flex justify-content-center">
                    <h3 class="h2-title">Pesquisar Dados</h3>
                </div>
            </div>
            <div class="row mb-5 mt-5">
                <div class="col d-flex justify-content-center gap-5">
                    <button class="btn-mostrar btn btn-primary"
                            onclick="MostrarDivSearch('MostrarTableCompra', 'MostrarTableCliente', 'MostrarTableVendedor', 'MostrarTableProduto')">
                        Compras</button>
                    <button class="btn-mostrar btn btn-primary"
                            onclick="MostrarDivSearch('MostrarTableCliente', 'MostrarTableCompra', 'MostrarTableVendedor', 'MostrarTableProduto')">
                        Clientes</button>
                    <button class="btn-mostrar btn btn-primary"
                            onclick="MostrarDivSearch('MostrarTableVendedor', 'MostrarTableProduto', 'MostrarTableCliente', 'MostrarTableCompra')">
                        Vendedores</button>
                    <button class="btn-mostrar btn btn-primary"
                            onclick="MostrarDivSearch('MostrarTableProduto', 'MostrarTableCliente', 'MostrarTableVendedor', 'MostrarTableCompra')">
                        Produtos</button>
                </div>
            </div>

            <div class="row">
                <div class="col d-flex justify-content-center">
                    <!--COMPRAS-->
                    <div id="MostrarTableCompra" class="table-div">
                        <input type="search" class="form-control mb-4" id="compraFilter" onkeyup="filterFunction('compras')" placeholder="Filtrar pelo nome">
                        <table class="table table-striped my-table" id="compraFilterTable">
                            <tr>
                                <th>Nome do Cliente</th>
                                <th>Nome do Vendedor</th>
                                <th>Nome do Produto</th>
                                <th>Valor</th>
                                <th>Ações</th>
                            </tr>
                            <c:forEach var="c" items="${compras}">
                                <tr>
                                    <td>${c.cliente.nome}</td>
                                    <td>${c.vendedor.nome}</td>
                                    <td>${c.produto.nome}</td>
                                    <td>R$${c.produto.valor}</td>
                                    <td>
                                        <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=editar&&id=${c.id}">
                                            <button type="button" class="btn btn-warning">Editar</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--CLIENTES-->
                    <div id="MostrarTableCliente" class="table-div">
                        <input type="search" class="form-control mb-4" id="clienteFilter" onkeyup="filterFunction('clientes')" placeholder="Filtrar pelo nome">
                        <table class="table table-striped my-table" id="clienteFilterTable">
                            <tr>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Endereco</th>
                                <th>Ações</th>
                            </tr>

                            <c:forEach var="c" items="${clientes}">
                                <tr>
                                    <td>${c.nome}</td>
                                    <td>${c.email}</td>
                                    <td>${c.endereco.cep}, ${c.endereco.cidade}, ${c.endereco.sigla}, ${c.endereco.rua}</td>
                                    <td>
                                        <a href="http://localhost:8080/projetoNegocio/cliente-controller?opcao=editar&&id=${c.id}">
                                            <button type="button" class="btn btn-warning">Editar</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--PRODUTOS-->
                    <div id="MostrarTableProduto" class="table-div">
                        <input type="search" class="form-control mb-4" id="produtoFilter" onkeyup="filterFunction('produtos')" placeholder="Filtrar pelo nome">
                        <table class="table table-striped my-table" id="produtoFilterTable">
                            <tr>
                                <th>Nome</th>
                                <th>Valor</th>
                                <th>Fabricante</th>
                                <th>Tipo</th>
                                <th>Ações</th>
                            </tr>
                            <c:forEach var="p" items="${produtos}">
                                <tr>
                                    <td>${p.nome}</td>
                                    <fmt:setLocale value = "pt_BR"/>
                                    <td><fmt:formatNumber type="currency"  minFractionDigits="2" maxFractionDigits="2" value="${p.valor}"/></td>
                                    <td>${p.fabricante}</td>
                                    <td>${p.tipo.nome}</td>
                                    <td>
                                        <a href="http://localhost:8080/projetoNegocio/produto-controller?opcao=editar&&id=${p.id}">
                                            <button type="button" class="btn btn-warning">Editar</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--VENDEDORES-->
                    <div id="MostrarTableVendedor" class="table-div">
                        <input type="search" class="form-control mb-4" id="vendedorFilter" onkeyup="filterFunction('vendedores')" placeholder="Filtrar pelo nome">
                        <table class="table table-striped my-table" id="vendedorFilterTable">
                            <tr>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Endereco</th>
                                <th>Ações</th>
                            </tr>
                            <c:forEach var="v" items="${vendedores}">
                                <tr>
                                    <td>${v.nome}</td>
                                    <td>${v.email}</td>
                                    <td>${v.endereco.cidade}, ${v.endereco.sigla}, ${v.endereco.rua}</td>
                                    <td>
                                        <a href="http://localhost:8080/projetoNegocio/vendedor-controller?opcao=editar&&id=${v.id}">
                                            <button type="button" class="btn btn-warning">Editar</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <!--JAVA SCRIPT-->
    <script type="text/javascript" src="script.js"></script>
</body>
</html>
