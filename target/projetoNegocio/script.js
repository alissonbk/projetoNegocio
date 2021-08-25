//IMPEDE QUE REDIRECIONAMENTO CADASTRE OU DELETE FORM
if ( window.history.replaceState ) {
    window.history.replaceState( null, null, window.location.href );
}
//MASCARA CEP
function mascara_cep(){
    var cep = document.getElementById("cep");
    if(cep.value.length == 5){
        cep.value += "-";
    }
}
//FUNCAO SIGLA PARA UPPERCASE
function forceInputUppercase(e)
{
    var start = e.target.selectionStart;
    var end = e.target.selectionEnd;
    e.target.value = e.target.value.toUpperCase();
    e.target.setSelectionRange(start, end);
}

// MASCARA PARA VALOR R$
String.prototype.reverse = function(){
    return this.split('').reverse().join('');
};
function mascaraMoeda(campo,evento){
    var tecla = (!evento) ? window.event.keyCode : evento.which;
    var valor  =  campo.value.replace(/[^\d]+/gi,'').reverse();
    var resultado  = "";
    var mascara = "########,##".reverse();
    for (var x=0, y=0; x<mascara.length && y<valor.length;) {
        if (mascara.charAt(x) != '#') {
            resultado += mascara.charAt(x);
            x++;
        } else {
            resultado += valor.charAt(y);
            y++;
            x++;
        }
    }
    campo.value = resultado.reverse();
}

//MOSTRAR OCULTAR E GERENCIAR DIVS
function MostrarDiv(el) {
    var display = document.getElementById(el).style.display;
    if(display == "none"){
        document.getElementById(el).style.display = 'block';
        document.getElementById('excecao').style.display = 'none';
    }else{
        document.getElementById(el).style.display = 'none';
    }

}
function OcultarDiv(el1, el2, el3, el4){
    document.getElementById(el1).style.display = 'none';
    document.getElementById(el2).style.display = 'none';
    document.getElementById(el3).style.display = 'none';
    document.getElementById(el4).style.display = 'none';
}

//faz o tratamento dos botões (impede que sejam mostradas 2 divs ao mesmo tempo)
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
function MostrarDivSearch(el1, el2, el3, el4){
    var display1 = document.getElementById(el1).style.display;
    var display2 = document.getElementById(el2).style.display;
    var display3 = document.getElementById(el3).style.display;
    var display4 = document.getElementById(el4).style.display;

    if(display1 == "none" && display2 == "none" && display3 == "none" && display4 == "none"){
        document.getElementById(el1).style.display = 'block';
    }else if(display1 == "none" && (display2 != "none" || display3 != "none" || display4 != "none")){
        document.getElementById(el2).style.display = 'none';
        document.getElementById(el3).style.display = 'none';
        document.getElementById(el4).style.display = 'none';
        document.getElementById(el1).style.display = 'block';
    }else{
        document.getElementById(el1).style.display = 'none';
    }
}



/*FUNÇÃO DE FILTRO*/
function filterFunction(el) {
    var input, filter, table, tr, td, i, txtValue;
    var nome = el;

    if(nome == "compras"){
        input = document.getElementById("compraFilter");
        filter = input.value.toUpperCase();
        table = document.getElementById("compraFilterTable");
        tr = table.getElementsByTagName("tr");
    } else if(nome == "clientes"){
        input = document.getElementById("clienteFilter");
        filter = input.value.toUpperCase();
        table = document.getElementById("clienteFilterTable");
        tr = table.getElementsByTagName("tr");
    }else if(nome == "vendedores"){
        input = document.getElementById("vendedorFilter");
        filter = input.value.toUpperCase();
        table = document.getElementById("vendedorFilterTable");
        tr = table.getElementsByTagName("tr");
    }else {
        input = document.getElementById("produtoFilter");
        filter = input.value.toUpperCase();
        table = document.getElementById("produtoFilterTable");
        tr = table.getElementsByTagName("tr");
    }

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

//SIGLA PARA UPPERCASE
document.getElementById("sigla").addEventListener("keyup", forceInputUppercase, false);

