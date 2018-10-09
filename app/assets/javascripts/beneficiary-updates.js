$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#show-updates').on('click', () => showUpdates());
   $('.view-update').on('click', () => viewUpdate());
}

function viewUpdate(updateId) {
    let id = $('.view-update').attr('data-id');
    //let updateId = $('.view-update').attr('data-updateid');
    $('#update').empty();
    $.get("/beneficiaries/" + id + "/updates/" + updateId, function(data) {
        let update = data;
        let updateDate = update["date"];
        let updateNote = update["notes"];
        let updateComplete = update["complete"];
        let comments = update["comments"];
        $("#update").append(`<h4>Case Note ${updateId} Details</h4>`);
        $("#update").append(`<p>Date: ${updateDate}, Note: ${updateNote}, Complete: ${updateComplete}</p>`);
        if(comments.length > 0) {
            for (i = 0; i < comments.length; i++) {
                comment = comments[i]["description"];
                date = comments[i]["created_at"].substring(0,10);
                $("#update").append(`<p>Comment: ${comment}, Date: ${date}</p>`);
            };
        };
        $("#update").append(`<a href="http://localhost:3000/beneficiaries/${id}/updates/${updateId}/comments/new ">Add Comment</a>`);
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
            $("#updates").append(`<p>Case Note ${update}: ${note} <button id="updateid-${update}">Details</button></p>`);
            $(`#updateid-${update}`).on('click', () => viewUpdate(update));
        };   
    });
};    