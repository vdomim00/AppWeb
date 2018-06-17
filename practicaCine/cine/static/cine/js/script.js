$(document).ready(function(){
               
});

function cambiarFiltro(){
    
    var ele = document.getElementById("filtroSala");
    var valor = ele.options[ele.selectedIndex].value;
    
    $("#tablaPed").html("");
    $("#submitConfirmarProveedor").hide();
    
    if(valor == "todos"){
        cargarPedidos();
    }else{
        cargarPedidosNo();
    }
}