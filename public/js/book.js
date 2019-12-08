var resultScreen = null;
var resultTimetable = null;
var movie_id = null;
var movie_title = null;
var timetable_id = null;
var screen_id = null;
var screen_name = null;
var col1 = null;
var col2 = null;

window.onload = function() {
    var movies = document.querySelectorAll('.movie_img');
    [].forEach.call(movies, function(movie){ 
        movie.addEventListener("click", movie_click, false); 
    }); 
}


function movie_click(e){
    
    movie_id = e.target.getAttribute('movie_id');
    movie_title = e.target.getAttribute('alt');
    var selectedMovie = {
        'id': movie_id,
        'title': movie_title
    }
    sendAjax(`/api/selected_movie/${movie_id}`, 'GET', selectedMovie, getAbleScreen);
}

function getAbleScreen (result) {
    
    col1 = document.getElementById("collapse1");
    col2 = document.getElementById("collapse2");
    col1.className = "panel-collapse collapse";
    col2.className = "panel-collapse collapse in";
    col2.style = 'none';

    resultScreen = document.querySelector('#collapse2 > .panel-body > table > tbody');
    while (resultScreen.firstChild) {
        resultScreen.firstChild.remove();
    }
   
    if (result.data) {
        result.data.forEach(function(element){
            var tr = document.createElement('tr');
            var td1 = document.createElement('td');
            var td2 = document.createElement('td');
            tr.setAttribute('class', 'ableScreen');
            td1.setAttribute('name', element.name);
            td1.setAttribute('id', element.id);
            td1.innerHTML = element.cinema;
            td2.innerHTML = element.name;
            tr.appendChild(td1);
            tr.appendChild(td2);
            resultScreen.appendChild(tr);
        });
        var screens = document.querySelectorAll('.ableScreen');
        [].forEach.call(screens,function(screen){ 
            screen.addEventListener("click", screen_click, false); 
        });
        resultScreen.lastChild.scrollIntoView();
    }
}


function screen_click(e){ 
    screen_id = e.target.getAttribute('id');
    screen_name = e.target.getAttribute('name');
    var selectedMovieAndScreen = {
        'movie_id': movie_id,
        'movie_title': movie_title,
        'screen_id': screen_id,
        'screen_name': screen_name
    }
    sendAjax(`/api/selected_movie/${movie_id}/selected_screen/${screen_id}`, 'GET', selectedMovieAndScreen, getAbleTimetable);

}

function getAbleTimetable(result){

    var col2 = document.getElementById("collapse2");
    var col3 = document.getElementById("collapse3");
    col2.className = "panel-collapse collapse";
    col3.className = "panel-collapse collapse in";
    col3.style = 'none';
    
    resultTimetable = document.querySelector('#collapse3 > .panel-body > div > dl');
    while (resultTimetable.firstChild) {
        resultTimetable.firstChild.remove();
    }
    if (result.data) {
        var dt = document.createElement('dt');
        var span = document.createElement('span');
        dt.setAttribute('class', 'mar1');
        span.setAttribute('class', 'grade_all');
        span.innerHTML = result.data[0].title;
        dt.appendChild(span)
        resultTimetable.appendChild(dt);

        result.data.forEach(function(element){
            var dd = document.createElement('dd');
            var ul = document.createElement('ul');
            ul.setAttribute('id', 'time_table');
            var li = document.createElement('li');
            var span1 = document.createElement('span');
            span1.setAttribute('class', 'ttb');
            var em = document.createElement('em');
            em.innerHTML = element.name + '관';
            span1.append(em);
            var span2 = document.createElement('span');
            span2.innerHTML = element.starttime + ' ~ ' + element.endtime;
            span2.setAttribute('class', 'clock');
            var span3 = document.createElement('span');
            span3.setAttribute('class', 'ppNum');
            span3.innerHTML = element.startdate.split('T')[0];
            li.appendChild(span1);
            li.appendChild(span2);
            li.appendChild(span3);
            ul.appendChild(li);
            dd.appendChild(ul);
            span2.setAttribute('class', 'ableTimetable');
            span2.setAttribute('timetable_id', element.id);
            resultTimetable.appendChild(dd);
        });

        var timetables = document.querySelectorAll('.ableTimetable');
        [].forEach.call(timetables,function(timetable){ 
            timetable.addEventListener("click", timetable_click, false); 
        });
        resultTimetable.lastChild.scrollIntoView();
    }
}


function timetable_click(e){ 
    timetable_id = e.target.getAttribute('timetable_id');

    var col3 = document.getElementById("collapse3");
    var col4 = document.getElementById("collapse4");
    col3.className = "panel-collapse collapse";
    col4.className = "panel-collapse collapse in";
    col4.style = 'none';

    var selAdu = document.getElementById('selAdu');
    var selTeen = document.getElementById('selTeen');
    selAdu.addEventListener('change', function(){
        number_of_adults = Number(selAdu.options[selAdu.selectedIndex].value);
    });
    
    selTeen.addEventListener('click', function(){
        var col4 = document.getElementById("collapse4");
        var col5 = document.getElementById("collapse5");
        col4.className = "panel-collapse collapse";
        col5.className = "panel-collapse collapse in";
        col5.style = 'none';

        sendAjax(`api/booking/timetable/${timetable_id}/seat`, 'GET', {}, showSeats);
    });
}

function showSeats(result){
    
    if (result){
        var ol = document.querySelector('.cabin');
        var li = null;
        var ol2 = null;
        result.data.forEach(function(item, index){
            if (index > 0){
                ol.appendChild(li);
                ol.appendChild(ol2);
            }
            if (index % 10 === 0){
                li = document.createElement('li');
                li.setAttribute('class', `row row--${Number(index/10)+1}`);
                ol2 = document.createElement('ol');
                ol2.setAttribute('class', 'seats');
                ol2.setAttribute('type', 'A');
                
            }
            var li2 = document.createElement('li');
            li2.setAttribute('class', 'seat');
            var label = document.createElement('label');
            label.setAttribute('for', item.seat_no);
            label.setAttribute('class', 'seat_label');
            label.setAttribute('seat_no', item.seat_no);
            label.setAttribute('is_able', item.is_able);
            label.innerHTML = item.seat_no;
            if (!(Number(item.is_able))){
                label.style.backgroundColor = 'red';
            }else{
                label.style.backgroundColor = 'black';
            }
            li2.appendChild(label);
            ol2.appendChild(li2);
        });
        ol.setAttribute('class', 'seat_table');
        ol.setAttribute('id', result.timetable_id);

        var seats = document.querySelectorAll('.seat_label');
        [].forEach.call(seats, function(seat, index){
            seat.addEventListener('click', selectSeat, false);
            seat.addEventListener('mouseover', overSeat, false);
            seat.addEventListener('mouseout', outSeat, false);
            seat.setAttribute('id', index);
        });
        
        var persons = document.getElementById('persons');
        persons.addEventListener('change', function(){
            number_of_persons = Number(persons.options[persons.selectedIndex].value);
        });
    }
}


var number_of_adults = 0;
var persons = 1; 
var number_of_persons = 1; 
var selected_seats_arr = new Set();

function selectSeat(e) {
    var idx = Number(e.target.id);

    if (selected_seats_arr.has(idx)){
        for(var i=idx;i < idx+number_of_persons;i++){
            var seat = document.querySelectorAll('.seat_label')[i];
            if (seat){
                if (Number(seat.getAttribute('is_able'))){
                    seat.addEventListener('mouseout', outSeat, false);
                    seat.style.backgroundColor = 'black';
                    selected_seats_arr.delete(i);
                }
            }
        }
    }else{
        if(selected_seats_arr.size + number_of_persons > number_of_adults){
            return;
        }
        for(var i=idx;i < idx+number_of_persons;i++){
            var seat = document.querySelectorAll('.seat_label')[i];
            if (seat){
                if (Number(seat.getAttribute('is_able'))){
                    seat.style.backgroundColor = 'blue';
                    selected_seats_arr.add(i);
                }
            }
        }
        if(selected_seats_arr.size === number_of_adults){
            var answer = confirm(`${movie_title} 영화를 예매 하시겠습니까?`);
            if (answer){
                if (selected_seats_arr.size){
                    var in_timetable_id = document.getElementById('in_timetable_id');
                    var in_number_of_seats = document.getElementById('in_number_of_seats');
                    var in_selected_seats_arr = document.getElementById('in_selected_seats_arr')
                    in_timetable_id.value = timetable_id;
                    in_number_of_seats.value = selected_seats_arr.size;
                    in_selected_seats_arr.value = Array.from(selected_seats_arr);
                    result_form.submit();
                }
            } else {
                number_of_adults = 0;
            }
        }
    }
}

function overSeat(e) {
    var idx = Number(e.target.id);
    for(var i=idx;i < idx+number_of_persons;i++){
        var seat = document.querySelectorAll('.seat_label')[i];
        if (seat){
            if (Number(seat.getAttribute('is_able'))){
                seat.style.backgroundColor = 'blue';
            }
        }
    }
}

function outSeat(e){
    var idx = Number(e.target.id);
    for(var i=idx;i < idx+number_of_persons;i++){
        var seat = document.querySelectorAll('.seat_label')[i];
        if (seat){
            if (Number(seat.getAttribute('is_able')) && !selected_seats_arr.has(i)){
                seat.style.backgroundColor = 'black';
            }
        }
    }
}

function sendAjax(url, method, data, fn){
    data = JSON.stringify(data);
    var xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(data);

    xhr.addEventListener('load', function(){
        var result = JSON.parse(xhr.responseText);
        fn(result);
    });
}