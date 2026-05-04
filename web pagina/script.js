function actualizarcontador(){
    const total =document.getElementById("lista").children.length
    document.getElementById("contador").textContent=total;
}
function agregar(){
        const valor=document.getElementById("datos").value;

        if(valor==="") return;
        const li=document.createElement("li")
        li.textContent=valor;

        const btn=document.createElement("button")
        btn.textContent="elimnar";

        btn.onclick=function(){
            li.remove();
            actualizarcontador();
        };

        li.appendChild(btn);
        document.getElementById("lista").appendChild(li);
        actualizarcontador();
}
