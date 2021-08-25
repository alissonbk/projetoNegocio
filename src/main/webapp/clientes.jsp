<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 08/07/2021
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>Clientes</title>
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
        <form action="cliente-controller" method="POST" class="my-form mb-3 mt-4">
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <c:choose>
                        <c:when test="${cliente.id != null}">
                            <h2 class="h2-title">Editar Cliente</h2>
                            <input type="hidden" name="idcliente" value="${cliente.id}"/>
                            <input type="hidden" name="idendereco" value="${cliente.endereco.id}"/>
                        </c:when>
                        <c:otherwise>
                            <h2 class="h2-title">Adicionar Cliente</h2>
                            <input type="hidden" name="idcliente" value="0"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label class="form-label">Nome</label>
                        <input  class="form-control" type="text" name="nome" value="${cliente.nome}" placeholder="Nome Completo" required/>
                        <label class="form-label">Email</label>
                        <input class="form-control" type="email" name="email" placeholder="email@email.com" value="${cliente.email}"/>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label class="form-label">CEP</label>
                                <input class="form-control" type="text" id="cep" maxlength="9" placeholder="99999-999" onkeyup="mascara_cep()" name="cep" value="${cliente.endereco.cep}" required/>
                            </div>
                            <div class="col">
                                <label class="form-label">Estado(Sigla)</label>
                                <input class="form-control" type="text" name="sigla" id="sigla" placeholder="Ex: SP" maxlength="2" value="${cliente.endereco.sigla}" required/>
                            </div>
                        </div>
                        <label class="form-label">Cidade</label>
                        <input class="form-control" type="text" name="cidade" placeholder="Ex: São Paulo" value="${cliente.endereco.cidade}" required/>
                        <label class="form-label">Endereço:</label>
                        <input class="form-control" type="text" name="rua" placeholder="Ex: Rua 25 de julho, 293" value="${cliente.endereco.rua}" required/>

                        <div class="row mt-3">
                            <div class="col">
                                <input type="hidden" name="opcao" value="gravar"/>
                                <input class="btn-gravar btn btn-primary" type="submit" value="Cadastrar">
                            </div>
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
                    <h3 class="h2-title">Cliente Cadastrado com sucesso!</h3>
                </c:if>
            </c:if>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="row mb-5">
                <div class="col d-flex justify-content-center">
                    <button class="btn-mostrar btn btn-outline-dark" onclick="MostrarDiv('MostrarTableCliente')">Mostrar Clientes</button>
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <div id="MostrarTableCliente" class="table-div">
                        <table class="table table-striped my-table">
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
                                        <a href="http://localhost:8080/projetoNegocio/cliente-controller?opcao=excluir&&id=${c.id}">
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
                    <!--Tratamento de exceção -->
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
