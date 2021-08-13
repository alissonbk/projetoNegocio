<%--
  Created by IntelliJ IDEA.
  User: aliss
  Date: 12/07/2021
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<html>
<head>
  <title>Vendedores</title>
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
    form input{
      margin-bottom: 18px;
    }
    h5#execao_h5{
      font-size: 16px;
      color: red;
    }
  </style>
</head>
<body>

<form action="vendedor-controller" method="POST">
  <c:choose>
    <c:when test="${vendedor.id != null}">
      <h1>Editar Vendedor</h1>
      <input type="hidden" name="idvendedor" value="${vendedor.id}"/>
      <input type="hidden" name="idendereco" value="${vendedor.endereco.id}"/>
    </c:when>
    <c:otherwise>
      <h1>Adicionar Vendedor</h1>
      <input type="hidden" name="idvendedor" value="0"/>
    </c:otherwise>
  </c:choose>


  Nome: <input type="text" name="nome" placeholder="Nome do vendedor" value="${vendedor.nome}" required/> <br />
  E-Mail: <input type="email" name="email" placeholder="E-mail do vendedor" value="${vendedor.email}" required/> <br />
  CEP: <input type="text" id="cep" maxlength="9" placeholder="99999-999" onkeyup="mascara_cep()" name="cep" value="${vendedor.endereco.cep}" required/> <br />
  Cidade: <input type="text" name="cidade" placeholder="São Paulo" value="${vendedor.endereco.cidade}" required/> <br />
  Sigla: <input type="text" name="sigla" maxlength="2" id="sigla" placeholder="SP" value="${vendedor.endereco.sigla}" required/> <br />
  Rua: <input type="text" name="rua" placeholder="Ex: Rua 25 de julho, 293" value="${vendedor.endereco.rua}" required/> <br />

  <input type="hidden" name="opcao" value="gravar"/>
  <input type="submit" value="GRAVAR">
</form>

<c:if test="${opcao == 'gravar'}">
  <c:if test="${retorno == 'OK'}">
    <h2>Vendedor Cadastrado com sucesso!</h2>
  </c:if>
</c:if>

<h1>Vendedores</h1>

<table>
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
        <a href="http://localhost:8080/projetoNegocio/vendedor-controller?opcao=excluir&&id=${v.id}">
          Excluir</a>
        <a href="http://localhost:8080/projetoNegocio/vendedor-controller?opcao=editar&&id=${v.id}">Editar</a>
      </td>
    </tr>
  </c:forEach>
  <c:if test="${retorno == 'Problems'}">
    <h5 id="execao_h5">Impossivel Remover vendedores com registro de compras!</h5>
  </c:if>
</table>



<br/>
<a href="./">Voltar</a>

<script>
  //impede que o redirecionamento cadastre outro form
  if ( window.history.replaceState ) {
    window.history.replaceState( null, null, window.location.href );
  }
  //mascara cep
  function mascara_cep(){
    var cep = document.getElementById("cep");
    if(cep.value.length == 5){
      cep.value += "-";
    }
  }
  // uppercase sigla
  function forceInputUppercase(e)
  {
    var start = e.target.selectionStart;
    var end = e.target.selectionEnd;
    e.target.value = e.target.value.toUpperCase();
    e.target.setSelectionRange(start, end);
  }
  document.getElementById("sigla").addEventListener("keyup", forceInputUppercase, false);
</script>
</body>
</html>