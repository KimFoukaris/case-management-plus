$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#show-updates').on('click', () => showUpdates());
   $('.view-update').on('click', () => viewUpdate());
   $('#add-comment').on('click', () => addComment());
}

function addComment(){
    $("#update").append('test addComment Listener');
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
        $("#update").append(`<h4>Update ${updateId} Details</h4>`);
        $("#update").append(`<p>Date: ${updateDate}, Note: ${updateNote}, Complete: ${updateComplete}</p>`);
        if(comments.length > 0) {
            for (i = 0; i < comments.length; i++) {
                comment = comments[i]["description"];
                date = comments[i]["created_at"];
                $("#update").append(`<p>Comment: ${comment}, Date: ${date}</p>`);
            };
        };
        $('#update').append(`<p><button id="add-comment" data-benid="${id}" data-updateid="${updateId}">Add Comment</button></p>`)
        $('#add-comment').on('click', () => addComment());
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
            $("#updates").append(`<p>Update ${update}: ${note} <button id="updateid-${update}">Details</button></p>`);
            $(`#updateid-${update}`).on('click', () => viewUpdate(update));
        };   
    });
};    