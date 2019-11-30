var visit = [];
window.onload = function(){
    var chkbox = document.getElementsByName('img'); 

    for(var i=0;i<chkbox.length;++i){
        chkbox[i].addEventListener("change",check);
    }
}
function check(){
    var chkbox = document.getElementsByName('img');
    var menuname = document.getElementById('menuname');
    var count = document.getElementById('count');
    for(var i=0 ; i<chkbox.length ; i++) { 
        var select = document.querySelector(".chk"+i);
        if(chkbox[i].checked) { 
            select.style.border ="solid 4px #FFBDBD";
            if(!visit[i]){
                visit[i] = true;
                var p = document.createElement("p");
                var input = document.createElement("input");
                var index = i +1;
                p.setAttribute('id', 'name'+index);
                input.setAttribute("type","number");
                input.setAttribute('class',"menu");
                input.setAttribute('id',index);
                input.setAttribute('value',1);
                input.setAttribute('min', 1);
                var text = document.createTextNode(chkbox[i].value);
                p.appendChild(text)
                menuname.appendChild(p);
                count.appendChild(input);
            }
        }
        else {
            select.style.border ="";
            if(visit[i]){
                visit[i] = false;
                var index = i + 1
                var re_p = document.getElementById('name'+index);
                var re_in = document.getElementById(index);
                //console.log(re);
                re_p.remove();
                re_in.remove();
            }
        }
    }
}