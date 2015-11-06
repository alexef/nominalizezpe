function ready() {
    $('.moderator_datatable').DataTable();
}

$(document).ready(ready);
$(document).on('page:load', ready);