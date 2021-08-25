//CIRCLE PROGRESS BAR
$(document).ready(function(){
    //Progress bar
    let containerA = document.getElementById("circleA");
    let numVendedores = document.getElementById("numVendedores").value;

    let circleA = new ProgressBar.Circle(containerA, {
        color: '#FFC947',
        strokeWidth: 8,
        duration: 1750,
        from: {color: '#AAA'},
        to: {color: '#FFC947'},
        step: function(state, circle){
            circle.path.setAttribute('stroke', state.color);

            let value = Math.round(circle.value() * numVendedores);
            circle.setText(value);
        }
    });

    let containerB = document.getElementById("circleB");
    let numClientes = document.getElementById("numClientes").value;

    let circleB = new ProgressBar.Circle(containerB, {
        color: '#FFC947',
        strokeWidth: 8,
        duration: 1750,
        from: {color: '#AAA'},
        to: {color: '#FFC947'},
        step: function(state, circle){
            circle.path.setAttribute('stroke', state.color);

            let value = Math.round(circle.value() * numClientes);
            circle.setText(value);
        }
    });

    let containerC = document.getElementById("circleC");
    let numProdutos = document.getElementById("numProdutos").value;

    let circleC = new ProgressBar.Circle(containerC, {
        color: '#FFC947',
        strokeWidth: 8,
        duration: 1750,
        from: {color: '#AAA'},
        to: {color: '#FFC947'},
        step: function(state, circle){
            circle.path.setAttribute('stroke', state.color);

            let value = Math.round(circle.value() * numProdutos);
            circle.setText(value);
        }
    });

    let containerD = document.getElementById("circleD");
    let numCompras = document.getElementById("numCompras").value;

    let circleD = new ProgressBar.Circle(containerD, {
        color: '#FFC947',
        strokeWidth: 8,
        duration: 1750,
        from: {color: '#AAA'},
        to: {color: '#FFC947'},
        step: function(state, circle){
            circle.path.setAttribute('stroke', state.color);

            let value = Math.round(circle.value() * numCompras);
            circle.setText(value);
        }
    });

    //mostra somente quando chega no elemento
    let dataAreaOffset = $('#data-area').offset();
    let stop = 0;

    $(window).scroll(function(e){
        let scroll = $(window).scrollTop();

        if(scroll > (dataAreaOffset.top - 1000) && stop == 0){
            circleA.animate(1.0);
            circleB.animate(1.0);
            circleC.animate(1.0);
            circleD.animate(1.0);
            stop = 1;
        }
    });

});