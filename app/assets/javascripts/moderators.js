function ready_moderator() {
    $('.moderator_datatable').DataTable();
}

$(document).ready(ready_moderator);
$(document).on('page:load', ready_moderator);