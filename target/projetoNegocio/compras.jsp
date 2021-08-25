<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 15/07/2021
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>Compras</title>
    <!--BOOTSTRAP5.1-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!--CSS-->
    <link href="css/style.css" rel="stylesheet"/>
    <!--BOOTSTRAP JS-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body class="form-body">
    <jsp:include page="header.jsp"/>


    <section>
        <form action="compra-controller" method="POST" class="compras-form mb-3 mt-4 gap-5">
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <c:choose>
                        <c:when test="${compra.id != null && compra.info == false}">
                            <h2 class="h2-title">Editar Compra</h2>
                            <input type="hidden" name="idcompra" value="${compra.id}"/>
                        </c:when>
                        <c:otherwise>
                            <h2 class="h2-title">Adicionar Compra</h2>
                            <input type="hidden" name="idcompra" value="0"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="container mt-4">
                <div class="row mb-5 gap-5">
                    <div class="col-5 mr-3">
                        <div class="form-group">
                            <label class="form-label">Nome do Cliente:</label>
                            <select name="id_cliente" class="form-select" required>
                                <c:forEach var="c" items="${clientes}">
                                    <option <c:if test="${compra.cliente.id == c.id}"> selected</c:if> value="${c.id}">${c.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Nome do Vendedor:</label>
                            <select name="id_vendedor" class="form-select" required>
                                <c:forEach var="v" items="${vendedores}">
                                    <option <c:if test="${compra.vendedor.id == v.id}"> selected</c:if> value="${v.id}">${v.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Nome do Produto:</label>
                            <select name="id_produto" class="form-select" required>
                                <c:forEach var="p" items="${produtos}">
                                    <option <c:if test="${compra.produto.id == p.id}"> selected</c:if> value="${p.id}">${p.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <input type="hidden" name="opcao" value="gravar"/>
                                <input class="btn-gravar btn btn-primary" type="submit" value="Registrar">
                            </div>
                        </div>
                    </div>

                    <div class="col-2 mr-3">
                        <c:if test="${compra.id != null && compra.info == true}">
                            <div id="MostrarInfo">
                                <div class="row mb-3">
                                    <button type="button" class="mostrar btn btn-primary" onclick="MostrarDiv2('MostrarCliente', 'MostrarVendedor', 'MostrarProduto')">Mostrar Cliente</button>
                                </div>
                                <div class="row mb-3">
                                    <button type="button" class="mostrar btn btn-primary" onclick="MostrarDiv2('MostrarVendedor', 'MostrarCliente', 'MostrarProduto')">Mostrar Vendedor</button>
                                </div>
                                <div class="row mb-3">
                                    <button type="button" class="mostrar btn btn-primary" onclick="MostrarDiv2('MostrarProduto', 'MostrarCliente', 'MostrarVendedor')">Mostrar Produto</button>
                                </div>
                                <div class="row mb-3">
                                    <button type="button" class="ocultar btn btn-warning" onclick="OcultarDiv('MostrarInfo', 'MostrarCliente', 'MostrarVendedor', 'MostrarProduto')">Ocultar Informações</button>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <div class="col">
                        <div style="display: none" id="MostrarCliente">
                            <c:forEach var="c" items="${clientes}">
                                <c:if test="${compra.cliente.id == c.id}">
                                    <h5>Nome:</h5> <p>${c.nome}</p>
                                    <h5>Email:</h5> <p>${c.email}</p>
                                    <h5>CEP:</h5> <p>${c.endereco.cep}</p>
                                    <h5>Cidade:</h5> <p>${c.endereco.cidade}</p>
                                    <h5>Estado:</h5> <p>${c.endereco.sigla}</p>
                                    <h5>Endereço:</h5> <p>${c.endereco.rua}</p>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div style="display: none" id="MostrarVendedor">
                            <c:forEach var="v" items="${vendedores}">
                                <c:if test="${compra.vendedor.id == v.id}">
                                    <h5>Nome:</h5> <p>${v.nome}</p>
                                    <h5>Email:</h5> <p>${v.email}</p>
                                    <h5>CEP:</h5> <p>${v.endereco.cep}</p>
                                    <h5>Cidade:</h5> <p>${v.endereco.cidade}</p>
                                    <h5>Estado:</h5> <p>${v.endereco.sigla}</p>
                                    <h5>Endereço:</h5> <p>${v.endereco.rua}</p>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div style="display: none" id="MostrarProduto">
                            <c:forEach var="p" items="${produtos}">
                                <c:if test="${compra.produto.id == p.id}">
                                    <h5>Produto:</h5> <p>${p.nome}</p>
                                    <fmt:setLocale value = "pt_BR"/>
                                    <h5>Preço:</h5>
                                    <p><fmt:formatNumber type="currency"  minFractionDigits="2" maxFractionDigits="2" value="${p.valor}"/></p>
                                    <h5>Fabricante:</h5> <p>${p.fabricante}</p>
                                    <h5>Tipo do produto:</h5> <p>${p.tipo.nome}</p>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>

    <div class="row mb-4">
        <div class="col d-flex justify-content-center">
            <c:if test="${opcao == 'gravar'}">
                <c:if test="${retorno == 'OK'}">
                    <h3 class="h2-title">Compra Registrada com sucesso!</h3>
                </c:if>
            </c:if>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="row mb-5">
                <div class="col d-flex justify-content-center">
                    <button class="btn-mostrar btn btn-outline-dark" onclick="MostrarDiv('MostrarTableCompra')">Mostrar Compras</button>
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <div id="MostrarTableCompra" class="table-div">
                        <table class="table table-striped my-table">
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
                                        <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=info&&id=${c.id}">
                                            <button type="button" class="btn btn-primary" onclick="MostrarDiv('MostrarInfo')">Mostrar Mais Informações</button></a>
                                        <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=editar&&id=${c.id}">
                                            <button type="button" class="btn btn-warning">Editar</button></a>
                                        <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=excluir&&id=${c.id}">
                                            <button type="button" class="btn btn-danger">Excluir</button></a>
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
