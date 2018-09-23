$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#show-updates').on('click', () => showUpdates());
}

function showUpdates() {
    $('#updates').empty();
    $('#updates').append('testing');
    $.get("/updates", function(data){
        $("#updates").append(data);
    });
}