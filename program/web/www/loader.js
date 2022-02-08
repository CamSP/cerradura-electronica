var startDate = new Date();
var date =  0 
var loader = document.getElementsByClassName('loader')
var title = document.getElementById('config-title')

const source = new EventSource('http://' + window.location.hostname + '/data');
while(date<15000){
    date = new Date() - startDate
    if(typeof(EventSource) !== 'undefined') {
        source.onmessage = function(e) {
            window.location.href = 'index.html';
        };
    }
}

title.innerHTML = "Cerradura configurada!"
loader[0].style.display = "none";
