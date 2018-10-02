$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#show-updates').on('click', () => showUpdates());

}

function viewUpdate() {
    $('#update').empty();
}

function showUpdates() {
    let id = $('#show-updates').attr('data-id');
    $('#updates').empty();
    $.get("/beneficiaries/" + id + "/updates", function(data) {
        let updates = data;
        for (i = updates.length -1; i > -1; i--) { 
          let update = updates[i]["id"];
          let date = updates[i]["date"];
          let note = updates[i]["notes"];
          let complete = updates[i]["complete"];
          $("#updates").append(`<p>Update: ${update}. Date: ${date}   Note: ${note}</p>`);
        };   
    });
};    