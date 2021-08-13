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
    <style>
        table{
            display: flex;
            align-items: center;
        }
        th{
            padding-right: 20px;
            alignment: center;
        }
        td{
            padding-right: 20px;
            padding-bottom: 15px;
            alignment: center;
        }
        form select{
            margin-bottom: 18px;
        }
        button.mostrar{
            margin-bottom:18px;
        }
        div#MostrarInfo{
            position: absolute;
            right: 40px;
            top: 20px;
        }
        div.container_select{
            display: flex;
            flex-wrap: nowrap;
            margin-bottom: 20px;
        }
        div.container_select select{
            margin: 16px;
        }
        div#MostrarCliente{
        }
        div#div_h5{
            margin: 10px;
            padding: 10px;
        }
        div#div_p{
            padding-left: 20px;
        }
        div#div_compras{
            display: block;
        }
    </style>
</head>
<body>

<form action="compra-controller" method="POST">
    <c:choose>
        <c:when test="${compra.id != null && compra.info == false}">
            <h1>Editar Compra</h1>
            <input type="hidden" name="idcompra" value="${compra.id}"/>
        </c:when>
        <c:otherwise>
            <h1>Adicionar Compra</h1>
            <input type="hidden" name="idcompra" value="0"/>
        </c:otherwise>
    </c:choose>

    <div class="container">
        <div class="container_select">
            <h4>Nome do Cliente:</h4>
            <select name="id_cliente" required>
                <c:forEach var="c" items="${clientes}">
                    <option <c:if test="${compra.cliente.id == c.id}"> selected</c:if> value="${c.id}">${c.nome}</option>
                </c:forEach>
            </select> <br />
        </div>

        <div class="container_select">
            <h4>Nome do Vendedor:</h4>
            <select name="id_vendedor" required>
                <c:forEach var="v" items="${vendedores}">
                    <option <c:if test="${compra.vendedor.id == v.id}"> selected</c:if> value="${v.id}">${v.nome}</option>
                </c:forEach>
            </select> <br />
        </div>

        <div class="container_select">
            <h4>Nome do Produto:</h4>
            <select name="id_produto" required>
                <c:forEach var="p" items="${produtos}">
                    <option <c:if test="${compra.produto.id == p.id}"> selected</c:if> value="${p.id}">${p.nome}</option>
                </c:forEach>
            </select> <br />
        </div>
    </div>
    <input type="hidden" name="opcao" value="gravar"/>
    <input type="submit" value="GRAVAR">
</form>


<c:if test="${compra.id != null && compra.info == true}">
    <div id="MostrarInfo">
        <button type="button" class="mostrar" onclick="MostrarDiv2('MostrarCliente', 'MostrarVendedor', 'MostrarProduto')">Mostrar Cliente</button>
        <button type="button" class="mostrar" onclick="MostrarDiv2('MostrarVendedor', 'MostrarCliente', 'MostrarProduto')">Mostrar Vendedor</button>
        <button type="button" class="mostrar" onclick="MostrarDiv2('MostrarProduto', 'MostrarCliente', 'MostrarVendedor')">Mostrar Produto</button>
        <button type="button" class="ocultar" onclick="OcultarDiv('MostrarInfo')">Ocultar Informações</button>
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
</c:if>

<c:if test="${opcao == 'gravar'}">
    <c:if test="${retorno == 'OK'}">
        <h2>Compra Registrada com sucesso!</h2>
    </c:if>
</c:if>
<div id="div_compras">
    <h1>Compras</h1>

    <table>
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
                        <button type="button" class="mostrar" onclick="MostrarDiv('MostrarInfo')">Mostrar Mais Informações</button></a>
                    <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=excluir&&id=${c.id}">
                        <button type="button">Excluir</button></a>
                    <a href="http://localhost:8080/projetoNegocio/compra-controller?opcao=editar&&id=${c.id}">
                        <button type="button">Editar</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>




<br/>
<a href="./">Voltar</a>

<script>
    //impede que o redirecionamento cadastre outro form
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }

    //funções para controle das divs de mostrar informações
    function MostrarDiv(el) {
        var display = document.getElementById(el).style.display;
        if(display == "none"){
            document.getElementById(el).style.display = 'block';
        }else{
            document.getElementById(el).style.display = 'none';
        }
    }
    function OcultarDiv(el){
        document.getElementById(el).style.display = 'none';
    }

    function MostrarDiv2(el1, el2, el3){
        var display1 = document.getElementById(el1).style.display;
        var display2 = document.getElementById(el2).style.display;
        var display3 = document.getElementById(el3).style.display;
        if(display1 == "none" && display2 == "none" && display3 == "none"){
            document.getElementById(el1).style.display = 'block';
        }else if(display1 == "none" && (display2 != "none" || display3 != "none")){
            document.getElementById(el2).style.display = 'none';
            document.getElementById(el3).style.display = 'none';
            document.getElementById(el1).style.display = 'block';
        }else{
            document.getElementById(el1).style.display = 'none';
        }

    }


</script>
</body>
</html>
