var visit = [];
window.onload = function(){
    var chkbox = document.getElementsByName('img'); 

    for(var i=0;i<chkbox.length;++i){
        chkbox[i].addEventListener("change",check);
    }
}
function check(){
    var chkbox = document.getElementsByName('img');
    var receipt = document.getElementById('receipt');
    var count = document.getElementById('count');
    for(var i=0 ; i<chkbox.length ; i++) { 
        var select = document.querySelector(".chk"+i);
        if(chkbox[i].checked) { 
            select.style.border ="solid 4px #FFBDBD";
            if(!visit[i]){
                visit[i] = true;
                var p = document.createElement("p");
                var input = document.createElement("input");
                p.setAttribute('id', 'p'+i);
                input.setAttribute("type","number");
                input.setAttribute('id','in'+i);
                input.setAttribute('value',1);
                var text = document.createTextNode(chkbox[i].value);
                p.appendChild(text)
                receipt.appendChild(p);
                count.appendChild(input);
            }
        }
        else {
            select.style.border ="";
            if(visit[i]){
                visit[i] = false;

                var re_p = document.getElementById('p'+i);
                var re_in = document.getElementById('in'+i);
                //console.log(re);
                re_p.remove();
                re_in.remove();
            }
        }
    }
}