﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Signup/Page.master" AutoEventWireup="true" CodeFile="Signup_Secondary.aspx.cs" Inherits="Views_UserApp_Signup_Signup_Secondary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* CSS for the form-check label text */
        .form-check-label {
            font-size: 14px; /* Adjust the font size as needed */
        }
        .label-alert {
            font-size: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="col-lg-12" style="text-align: center">
                    <br />
                    <h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>
                    </h1>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <h4>Hi there, Welcome!</h4>
                                <h4>Sign up to continue</h4>
                            </div>
                        </div>

                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-unlock-alt icon"></i>
                                    <input type="password" id="password" class="form-control input" placeholder="Password" />
                                    <i class="far fa-eye icon-right" id="togglePassword" style="cursor: pointer;"></i>
                                </div>
                                <label id="passwordValidationMessage" class="label-alert text-danger"></label>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-unlock-alt icon"></i>
                                    <input type="password" id="confirmPass" class="form-control input" placeholder=" Confirm Password" />
                                    <i class="far fa-eye icon-right" id="toggleConfirmPassword" style="cursor: pointer;"></i>

                                </div>
                                <label id="confirmPassValidationMessage" class="label-alert text-danger"></label>
                            </div>
                            <div class="group form-check">
                                <!-- Move the checkbox to the left -->
                                <input type="checkbox" id="agreeCheckbox" style="margin-right: 8px;" />
                               
                                    <a id="termsAndConditionsLink"> <h6 class="form-check-label" style="cursor:pointer">I agree to <b>Terms & Conditions</b> and <b>Policy</b></h6></a>
                        
                                <br />
                            </div>
                            <label id="agreementValidationMessage" class="label-alert text-danger"></label>
                            <%--   <div class="input">
                              
                            </div>--%>
                            <%--<button type="button" class="btn btn-primary" id="btnSave" onclick="SaveClick()">Save</button>--%>
                        </div>
                    </div>

                </div>
            </div>
        </section>
         <div class="modal fade" id="termsModal"  style="z-index:99999;" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Terms & Conditions</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                      <div class="form-group">
                                    <img src="../../../Resources/dist/img/aboutus.jpg" width="200" height="200" class="img-circle" style="box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);" />
                                </div>
                   <p style="text-align:center;">
                       Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt 
                       ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                       laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                       velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                       sunt in culpa qui officia deserunt mollit anim id est laborum.
                   </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    </div>

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            hideAlertLabels();
            initializePasswordValidation();
            initializeConfirmPasswordValidation();
            PromptTermsAndConditions();
        });
        function hideAlertLabels() {
            $('.label-alert').hide();
        }
        function hideAlertLabel(labelId) {
            var label = $('#' + labelId);
            label.hide();
        }
        function showAlertLabel(labelId, message) {
            var label = $('#' + labelId);
            label.text(message);
            label.show();
        }
        const togglePassword = document.querySelector('#togglePassword');
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const password = document.querySelector('#password');
        const confirmPass = document.querySelector('#confirmPass');
        togglePassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);

            this.classList.toggle('fa-eye-slash');
        });
        toggleConfirmPassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = confirmPass.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPass.setAttribute('type', type);

            this.classList.toggle('fa-eye-slash');


        });
        function initializePasswordValidation() {
            password.addEventListener('input', function () {
                const passwordValue = password.value;
                const passwordInput = document.getElementById('password');

                // Check if the password meets the criteria
                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
                const isValidPassword = passwordRegex.test(passwordValue);

                if (isValidPassword) {
                    // If valid, remove red border (if previously added)
                    passwordInput.style.border = '';
                    // Hide the password validation message
                    hideAlertLabel('passwordValidationMessage');
                } else {
                    // If not valid, add red border to the password input
                    passwordInput.style.border = '1px solid red';
                    // Show the password validation message
                    showAlertLabel('passwordValidationMessage', 'Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
                }
            });
        }

        function initializeConfirmPasswordValidation() {
            confirmPass.addEventListener('input', function () {
                const password = document.getElementById('password').value;
                const confirmPass = document.getElementById('confirmPass').value;
                const confirmPassInput = document.getElementById('confirmPass');

                // Check if the confirm password matches the password
                if (password !== confirmPass) {
                    // If not matched, add red border to the confirm password input
                    confirmPassInput.style.border = '3px solid red';
                    // Show the confirm password validation message
                    showAlertLabel('confirmPassValidationMessage', 'Passwords do not match.');
                } else {
                    // If matched, add green border to the confirm password input
                    confirmPassInput.style.border = '3px solid green';
                    // Hide the confirm password validation message
                    hideAlertLabel('confirmPassValidationMessage');
                }
            });
        }
        function validateForm() {
            const passwordValue = document.getElementById('password').value;
            const confirmPassValue = document.getElementById('confirmPass').value;
            const isValidPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/.test(passwordValue);
            const passwordsMatch = passwordValue === confirmPassValue;
            const isValidAgreement = document.getElementById('agreeCheckbox').checked;

            // Hide all validation messages first
            hideAlertLabel('passwordValidationMessage');
            hideAlertLabel('confirmPassValidationMessage');
            hideAlertLabel('agreementValidationMessage');

            // Validate password
            if (!isValidPassword) {
                document.getElementById('password').style.border = '1px solid red';
                showAlertLabel('passwordValidationMessage', 'Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
            } else {
                document.getElementById('password').style.border = '';
            }

            // Validate confirm password
            if (!passwordsMatch) {
                document.getElementById('confirmPass').style.border = '1px solid red';
                showAlertLabel('confirmPassValidationMessage', 'Passwords do not match.');
            } else {
                document.getElementById('confirmPass').style.border = '';
            }

            // Validate agreement checkbox
            if (!isValidAgreement) {
                showAlertLabel('agreementValidationMessage', 'You must agree to the Terms & Conditions and Policy.');
            }

            // Return true if all fields are valid, otherwise false
            return isValidPassword && passwordsMatch && isValidAgreement;
        }

        function SaveClick() {
            if (validateForm()) {
                const params = new Proxy(new URLSearchParams(window.location.search), {
                    get: (searchParams, prop) => searchParams.get(prop),
                });
                const userName = params.USERNAME;
                const phoneNumber = params.PHONENUMBER;
                const Email = params.EMAIL;
                const Password = $('#confirmPass').val();

                // Now you have the values in the respective variables

                $.ajax({
                    url: 'Signup_Secondary.aspx/UserSignUp',
                    type: "POST",
                    data: JSON.stringify({
                        username: userName,
                        phonenumber: phoneNumber,
                        email: Email,
                        password: Password


                    }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (e) {
                        alert('Click Ok to continue');
                        window.location = "Signup_Primary.aspx?true";

                    }, error: function (error) {
                        // Handle the error response
                        alert(error, 'error');

                    }
                });

            } else {
                // Validation failed, do not proceed with the save action

                console.log('Validation failed. Data not saved.');
            }
        }


        const PromptTermsAndConditions = () => {
            $('#termsAndConditionsLink').on('click', function () {
                $('#termsModal').modal('show'); // 'termsModal' should be the id of your modal element
            });
        }

    </script>
</asp:Content>

