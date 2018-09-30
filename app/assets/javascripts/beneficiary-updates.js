$(document).ready(function () {
   attachListeners();
});

function attachListeners() {
   $('#view-edit').on('click', () => viewUpdate());

}

function viewUpdate() {
    $('#update').empty();
}