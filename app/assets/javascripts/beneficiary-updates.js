$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#show-updates').on('click', () => showUpdates());
   $('.view-update').on('click', () => viewUpdate());
}

function viewUpdate() {
    let id = $('.view-update').attr('data-id');
    let updateId = $('.view-update').attr('data-updateid');
    $('#update').empty();
    $.get("/beneficiaries/" + id + "/updates/" + updateId, function(data) {
        let update = data;
        let updateDate = update["date"];
        let updateNote = update["notes"];
        let comments = update["comments"];
        $("#update").append(`<p>Date: ${updateDate}, Note: ${updateNote}</p>`);
        if(comments.length > 0) {
            for (i = 0; i < comments.length; i++) {
                comment = comments[i]["description"];
                $("#update").append(`<p>Comment: ${comment}</p>`);
            };
        };
    });
};  

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