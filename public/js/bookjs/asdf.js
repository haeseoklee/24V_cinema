function pageLoad() {
    document.getElementById("movie1").onclick = select;
    document.getElementById("movie2").onclick = select;
    document.getElementById("movie3").onclick = select;
    document.getElementById("movie4").onclick = select;
    document.getElementById("movie5").onclick = select;
}
function select() {
    var col1 = document.getElementById("collapse1");
    col1.className = "panel-collapse collapse";
    var col2 = document.getElementById("collapse2");
    col2.className = "panel-collapse collapse in";
}
window.onload = pageLoad;