$(document).ready(function(){
               
});

function filtroSala(){
    
    var ele = document.getElementById("filtroSala");
    var sala = ele.options[ele.selectedIndex].value;
    var list = "";
    
    console.log("HEY");
    
    $.ajax({
        url: "ajax/cargarAsientos",
        data: {
          'sala': sala
        },
        type: "GET",
        dataType: 'json', // This is the default though, you don't actually need to always mention it
        success: function(data) {
            var numFilas = data["filas"];
            var numAsientosFila = data["asientosFila"];
            var numAsientosUltimaFila = data["asientosUltimaFila"];
            var i = 0;
            var aloBuf = [];
            var list2 = "";
            
            console.log("NumFilas "+numFilas);
            console.log("NumAsientosFila "+numAsientosFila);
            console.log("NumAsientosUltimaFila "+numAsientosUltimaFila);
            
            
            for (i=1; i<numFilas; i++){
                list2 = "<div class=\"fila_"+i+"\">";
                aloBuf.push(list2);
                list2 = "<p>Fila "+i+"</p>";
                aloBuf.push(list2);
                for (j=0; j<numAsientosFila;j++){
                    list2 = "<input class=\""+i+"_"+j+"\" type=\"checkbox\" onclick=\" \"/>";
                    aloBuf.push(list2);
                }
                aloBuf.push('</div>');
            }
            
            list2 = "<p>Fila "+numFilas+" (Última)</p>";
            aloBuf.push(list2);
            for (j=0; j<numAsientosUltimaFila;j++){
                list2 = "<input class=\""+i+"_"+j+"\" type=\"checkbox\"/>";
                aloBuf.push(list2);
            }
            aloBuf.push('</div>');
            list = aloBuf.join('\n');
            $("#checkReserva").html(list);
            
        },
        failure: function(data) { 
            alert('Got an error dude');
        }
    });
}