var defaultImage;

$(document).ready(readyPeople);
$(document).on('page:load', readyPeople);

function readyPeople() {
    changeImageInput();
    $("#person_picture_url").change(changeImageInput);
    defaultImage = $("#person_image");
};

function changeImageInput() {
    var pictureUrl = $("#person_picture_url").val();
    var img = $("<img id='person_image' style='width:200px;height:200px'/>").attr('src', pictureUrl)
        .on('load', function() {
            if (this.complete && typeof this.naturalWidth !== "undefined" && this.naturalWidth > 0) {
                $("#person_image").replaceWith(img);
                $("#person_image").change(changeImageInput);
            } else {
                $("#person_picture_url").val('');
                $("#person_image").replaceWith(defaultImage);
                alert("Poza nu este intr-un format suportat!")
            }
        });
}

dataConfirmModal.setDefaults({
    title: 'Esti sigur?',
    commit: 'Sunt sigur',
    cancel: 'M-am razgandit'
});
