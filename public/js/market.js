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

document.getElementById("purchase").addEventListener('click', function(){
    var data = {}
    var menu = document.querySelectorAll(".menu");
    data.arr = [];
    for(var i=0;i < menu.length; ++i){
        info = {}
        info.id = Number(menu[i].id);
        info.value = Number(menu[i].value);
        data.arr.push(info)
    }
    sendAjax('/market', data, showOrderedMenu);
})

function sendAjax(url, data, fn){
    data = JSON.stringify(data);
    var xhr = new XMLHttpRequest();
    xhr.open('post', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(data);
    
    xhr.addEventListener('load', function(){
        var result = JSON.parse(xhr.responseText);
        fn(result);
    });
}

function showOrderedMenu (result){
    var data = result.resData
    if(data.resArr.length){
        var receipt = document.getElementById("receipt")
        receipt.innerHTML = "";
        var da = data.resArr
        var total = 0;
        for( menu_ in da){
            var p = document.createElement("p");
            var num = document.getElementById(da[menu_].id).value;
            var text = document.createTextNode(da[menu_].name +" "+da[menu_].price*num +"원");
            total +=da[menu_].price*num;
            p.appendChild(text)
            receipt.appendChild(p);
        }
        var p = document.createElement("p");
        var text = document.createTextNode("총 "+total +"원");
        p.appendChild(text)
        receipt.appendChild(p);
    }
}
