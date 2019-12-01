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
    var menu = document.querySelectorAll(".menu")
    var str = "{";
    for(var i=0;i<menu.length;++i){
        str += '"' + menu[i].id + '":' +menu[i].value;
        if(i < menu.length-1) str+=","
        // console.log(menu[i]);
    }
    str +="}"
    var inputData = JSON.parse(str);
    sendAjax('/market',inputData);
})

function sendAjax(url, data){
    data = JSON.stringify(data);
    var xhr = new XMLHttpRequest();
    xhr.open('post', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(data);
    
    xhr.addEventListener('load', function(){
        // console.log(xhr.responseText);
        var result = JSON.parse(xhr.responseText);
        // console.log(result.reqData.data)

        var receipt = document.getElementById("receipt")
        receipt.innerHTML = "";
        var da = result.reqData.data
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
    });
}

// function order(){
//     var answer = confirm(`구매 하시겠습니까?`);
//     if (answer){
//         if (selected_seats_arr.size){
//             var in_timetable_id = document.getElementById('in_timetable_id');
//             var in_number_of_seats = document.getElementById('in_number_of_seats');
//             var in_selected_seats_arr = document.getElementById('in_selected_seats_arr')
//             in_timetable_id.value = timetable_id;
//             in_number_of_seats.value = selected_seats_arr.size;
//             in_selected_seats_arr.value = Array.from(selected_seats_arr);
//             result_form.submit();
//         }
//     } else {
//         number_of_teenagers = 0;
//         number_of_adults = 0;
//     }

// }


// function selectSeat(e) {
//     var idx = Number(e.target.id);
// }