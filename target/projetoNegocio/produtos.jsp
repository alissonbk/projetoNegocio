<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 12/07/2021
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>

<html lang="pt-br">
<head>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
    <title>Produtos</title>
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
        <form action="produto-controller" method="POST" class="my-form mb-3 mt-4">
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <c:choose>
                        <c:when test="${produto.id != null}">
                            <h2 class="h2-title">Editar Produto</h2>
                            <input type="hidden" name="idproduto" value="${produto.id}"/>
                        </c:when>
                        <c:otherwise>
                            <h2 class="h2-title">Adicionar Produto</h2>
                            <input type="hidden" name="idproduto" value="0"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>


            <div class="form-group">
                <label class="form-label">Nome:</label>
                <input class="form-control" type="text" name="nome" placeholder="Ex:Tênis N38" value="${produto.nome}" required/>
                <label class="form-label">Valor R$</label>
                <input class="form-control" type="text" onkeyup="mascaraMoeda(this, event)" placeholder="Preço" step="0.01" min="0" name="valor" value="${produto.valor}" required/>
                <label class="form-label">Fabricante:</label>
                <input class="form-control" type="text" name="fabricante" placeholder="Nome da fabricante" value="${produto.fabricante}" required/>
                <label class="form-label">Tipo:</label>
                <select class="form-select" name ="id_tipo">
                    <option value="1" <c:if test="${produto.tipo.id == 1}"> selected </c:if>>Diversos</option>
                    <option value="2" <c:if test="${produto.tipo.id == 2}"> selected </c:if>>Calçados</option>
                    <option value="3" <c:if test="${produto.tipo.id == 3}"> selected </c:if>>Moveis</option>
                    <option value="5" <c:if test="${produto.tipo.id == 5}"> selected </c:if>>Eletrônicos</option>
                    <option value="6" <c:if test="${produto.tipo.id == 6}"> selected </c:if>>Utensílios Domésticos</option>
                    <option value="7" <c:if test="${produto.tipo.id == 7}"> selected </c:if>>Ferramentas</option>
                </select>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <input type="hidden" name="opcao" value="gravar"/>
                    <input class="btn-gravar btn btn-primary" type="submit" value="Cadastrar">
                </div>
            </div>
        </form>
    </section>

    <div class="row mb-4">
        <div class="col d-flex justify-content-center">
            <c:if test="${opcao == 'gravar'}">
                <c:if test="${retorno == 'OK'}">
                    <h3 class="h2-title">Produto Cadastrado com sucesso!</h3>
                </c:if>
            </c:if>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="row mb-5">
                <div class="col d-flex justify-content-center">
                    <button class="btn-mostrar btn btn-outline-dark" onclick="MostrarDiv('MostrarTableProduto')">Mostrar Produtos</button>
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <div id="MostrarTableProduto" class="table-div">
                        <table class="table table-striped my-table">
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
                                        <a href="http://localhost:8080/projetoNegocio/produto-controller?opcao=excluir&&id=${p.id}">
                                            <button type="button" class="btn btn-danger">Excluir</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <c:if test="${retorno == 'Problems'}">
                        <div id="excecao" class="alert alert-danger" role="alert">
                            Impossível remover clientes com registro de compra
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>



    <!--JAVA SCRIPT-->
    <script type="text/javascript" src="script.js"></script>
</body>
</html>

