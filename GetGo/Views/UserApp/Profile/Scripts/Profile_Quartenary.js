﻿//const params = new Proxy(new URLSearchParams(window.location.search), {
//    get: (searchParams, prop) => searchParams.get(prop),
//});

//const userId = params.UserId;
const params = new Proxy(new URLSearchParams(window.location.search), {
    get: (searchParams, prop) => searchParams.get(prop),
});
const userId = params.USERID;
/*console.log(userId)*/
$(document).ready(function () {
    fetchUserDetails(userId);
});

function fetchUserDetails(input) {
    var items = {
        INPUT: input
    }
    // Make an AJAX request to fetch the user details
    $.ajax({
        url: 'Profile_Primary.aspx/GetUserDetails',
        type: "POST",
        data: JSON.stringify({ item: items }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            var userDetails = response.d;

            // Populate the textboxes with the retrieved user details
            var userDetails = JSON.parse(response.d);
            $('#txtUserID').val(userDetails[0].USER_ID);
            var frontfaceImg = userDetails[0].FRONTFACE; 
            if (frontfaceImg) {
                var filename = frontfaceImg.split('/').pop();
                $('#frontface').siblings('.custom-file-label').text(filename);
            }

            var backfaceImg = userDetails[0].BACKFACE; 
            if (backfaceImg) {
                var filename = backfaceImg.split('/').pop();
                $('#backface').siblings('.custom-file-label').text(filename);
            }

            var signatureImg = userDetails[0].SIGNATURE_;
            if (signatureImg) {
                var filename = signatureImg.split('/').pop();
                $('#signature').siblings('.custom-file-label').text(filename);
            }
            //alert(userDetails);
        },
        error: function (error) {
            //alert(error,userId,userName,phoneNumber);
            // Handle the error response
            alert('ERROR');
            console.log(error);

        }
    });
}
const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];

$('.custom-file-input').change(function () {
    if (!allowedExtension.includes(this.files[0]['type'])) {
        alert('Only (jpeg, jpg, png) file extensions can be uploaded!')
        $(this).val('');
        $('.custom-file-label').text('Attach photo here');
    }
});

function SaveClick () {
    var files = $('.custom-file-input');
    files.each(function (index, fileInput) {
        var formData = new FormData();
        formData.append("file", fileInput.files[0]);
        formData.append("classification", fileInput.getAttribute("data-classification"));
        upload(formData);

        //console.log(formData.append("classification", fileInput.getAttribute("data-classification")));
/*        alert(formData);*/
    });
  alert('success')
    window.location = "Profile_Quartenary.aspx?USERID=" + $('#txtUserID').val();
};
//    var files = $('.custom-file-input');
//    var formData = new FormData();
//    for (var i = 0; i < 3; i++) {
//        formData.append("file", files[i].files[0]);
//    }
//    upload(formData);
//

function upload(files) {
    /*    console.log(files);*/

    $.ajax({
        type: 'post',
        url: '../Profile/Handlers/FileUpload.ashx?USERID='+$('#txtUserID').val(),
        data: files,
        cache: false,
        processData: false,
        contentType: false,
        success: function (e) {
         
            //alert('success');
            fetchUserDetails($('#txtUserID').val());
     
        },
        error: function (err) {
            alert(err);
        }
    })
}


