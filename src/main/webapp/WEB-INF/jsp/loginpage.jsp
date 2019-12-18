<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 21-May-19
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
    <link rel="shortcut icon" href="http://sstatic.net/stackoverflow/img/favicon.ico">
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <spring:url value="/img" var="images" />
    <spring:url value="/core/css/login.css" var="logincss" />
    <spring:url value="/erapay/index" var="home" />
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <title>ERA Payment</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato"
          rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat"
          rel="stylesheet" type="text/css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <style>




        /*//////////////////////////////////////////////////////////////////
        [ FONT ]*/

        @font-face {
            font-family: Poppins-Regular;
            src: url('../fonts/poppins/Poppins-Regular.ttf');
        }

        @font-face {
            font-family: Poppins-Medium;
            src: url('../fonts/poppins/Poppins-Medium.ttf');
        }

        @font-face {
            font-family: Poppins-Bold;
            src: url('../fonts/poppins/Poppins-Bold.ttf');
        }

        @font-face {
            font-family: Poppins-SemiBold;
            src: url('../fonts/poppins/Poppins-SemiBold.ttf');
        }

        @font-face {
            font-family: Montserrat-Bold;
            src: url('../fonts/montserrat/Montserrat-Bold.ttf');
        }

        @font-face {
            font-family: Montserrat-SemiBold;
            src: url('../fonts/montserrat/Montserrat-SemiBold.ttf');
        }

        @font-face {
            font-family: Montserrat-Regular;
            src: url('../fonts/montserrat/Montserrat-Regular.ttf');
        }


        /*//////////////////////////////////////////////////////////////////
        [ RESTYLE TAG ]*/

        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: Poppins-Regular, sans-serif;
        }
        .navbar {
            font-family: Montserrat, sans-serif;
            margin-bottom: 0;
            background-color: #F2F2F2;
            border: 0;
            font-size: 15px !important;
            letter-spacing: 4px;
            opacity: 0.9;
        }
        .navbar-fixed-top {
            min-height: 80px;
        }

        .navbar li a, .navbar .navbar-brand {
            color: black !important;
        }
        .navbar-nav li a:hover {
            color: #e2c802 !important;
        }
        .navbar-nav li.active a {
            color: #fff !important;
            background-color: #29292c !important;
        }
        .navbar-default .navbar-toggle {
            border-color: transparent;
        }

        /*---------------------------------------------*/
        a {
            font-family: Poppins-Regular;
            font-size: 14px;
            line-height: 1.7;
            color: #666666;
            margin: 0px;
            transition: all 0.4s;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
        }

        a:focus {
            outline: none !important;
        }

        a:hover {
            text-decoration: none;
            color: #6675df;
        }

        /*---------------------------------------------*/
        h1,h2,h3,h4,h5,h6 {
            margin: 0px;
        }

        p {
            font-family: Poppins-Regular;
            font-size: 14px;
            line-height: 1.7;
            color: #666666;
            margin: 0px;
        }

        ul, li {
            margin: 0px;
            list-style-type: none;
        }


        /*---------------------------------------------*/
        input {
            outline: none;
            border: none;
        }

        textarea {
            outline: none;
            border: none;
        }

        textarea:focus, input:focus {
            border-color: transparent !important;
        }

        input:focus::-webkit-input-placeholder { color:transparent; }
        input:focus:-moz-placeholder { color:transparent; }
        input:focus::-moz-placeholder { color:transparent; }
        input:focus:-ms-input-placeholder { color:transparent; }

        textarea:focus::-webkit-input-placeholder { color:transparent; }
        textarea:focus:-moz-placeholder { color:transparent; }
        textarea:focus::-moz-placeholder { color:transparent; }
        textarea:focus:-ms-input-placeholder { color:transparent; }

        input::-webkit-input-placeholder { color: #999999;}
        input:-moz-placeholder { color: #999999;}
        input::-moz-placeholder { color: #999999;}
        input:-ms-input-placeholder { color: #999999;}

        textarea::-webkit-input-placeholder { color: #999999;}
        textarea:-moz-placeholder { color: #999999;}
        textarea::-moz-placeholder { color: #999999;}
        textarea:-ms-input-placeholder { color: #999999;}


        label {
            display: block;
            margin: 0;
        }

        /*---------------------------------------------*/
        button {
            outline: none !important;
            border: none;
            background: transparent;
        }

        button:hover {
            cursor: pointer;
        }

        iframe {
            border: none !important;
        }

        /*//////////////////////////////////////////////////////////////////
        [ utility ]*/

        /*==================================================================
        [ Text ]*/
        .txt1 {
            font-family: Montserrat-Regular;
            font-size: 13px;
            line-height: 1.4;
            color: #555555;
        }

        .txt2 {
            font-family: Montserrat-Regular;
            font-size: 13px;
            line-height: 1.4;
            color: #999999;
        }


        /*==================================================================
        [ Size ]*/
        .size1 {
            width: 355px;
            max-width: 100%;
        }

        .size2 {
            width: calc(100% - 43px);
        }

        /*==================================================================
        [ Background ]*/
        .bg1 {background: #3b5998;}
        .bg2 {background: #1da1f2;}
        .bg3 {background: #cd201f;}


        /*//////////////////////////////////////////////////////////////////
        [ login ]*/
        .limiter {
            width: 100%;
            margin: 0 auto;
        }

        .container-login100 {
            width: 100%;
            min-height: 100vh;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            background: #f2f2f2;
        }


        .wrap-login100 {
            width: 100%;
            background: #fff;
            overflow: hidden;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            flex-direction: row-reverse;

        }

        /*==================================================================
        [ login more ]*/
        .login100-more {
            width: calc(100% - 560px);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            position: relative;
            z-index: 1;
        }

        .login100-more::before {
            content: "";
            display: block;
            position: absolute;
            z-index: -1;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: rgba(0,0,0,0.1);
        }



        /*==================================================================
        [ Form ]*/

        .login100-form {
            width: 560px;
            min-height: 20vh;
            display: block;
            background-color: #ffffff;
            padding: 35px 55px 55px 55px;
            border-radius: 15px;
            border-color:blue;
        }

        .login100-form-title {
            width: 100%;
            display: block;
            font-family: Poppins-Regular;
            font-size: 30px;
            color: #333333;
            line-height: 1;
            text-align: center;
        }



        /*------------------------------------------------------------------
        [ Input ]*/

        .wrap-input100 {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            width: 100%;
            height: 80px;
            position: relative;
            border: 1px solid #e6e6e6;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .label-input100 {
            font-family: Montserrat-Regular;
            font-size: 18px;
            color: #999999;
            line-height: 1.2;

            display: block;
            position: absolute;
            pointer-events: none;
            width: 100%;
            padding-left: 24px;
            left: 0;
            top: 30px;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

        .input100 {
            display: block;
            width: 100%;
            background: transparent;
            font-family: Montserrat-Regular;
            font-size: 18px;
            color: #555555;
            line-height: 1.2;
            padding: 0 26px;
        }

        input.input100 {
            height: 100%;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

        /*---------------------------------------------*/

        .focus-input100 {
            position: absolute;
            display: block;
            width: calc(100% + 2px);
            height: calc(100% + 2px);
            top: -1px;
            left: -1px;
            pointer-events: none;
            border: 1px solid #6675df;
            border-radius: 10px;
            visibility: hidden;
            opacity: 0;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;

            -webkit-transform: scaleX(1.1) scaleY(1.3);
            -moz-transform: scaleX(1.1) scaleY(1.3);
            -ms-transform: scaleX(1.1) scaleY(1.3);
            -o-transform: scaleX(1.1) scaleY(1.3);
            transform: scaleX(1.1) scaleY(1.3);
        }

        .input100:focus + .focus-input100 {
            visibility: visible;
            opacity: 1;

            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transform: scale(1);
        }

        .eff-focus-selection {
            visibility: visible;
            opacity: 1;

            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transform: scale(1);
        }

        .input100:focus {
            height: 48px;
        }

        .input100:focus + .focus-input100 + .label-input100 {
            top: 14px;
            font-size: 13px;
        }

        .has-val {
            height: 48px !important;
        }

        .has-val + .focus-input100 + .label-input100 {
            top: 14px;
            font-size: 13px;
        }

        /*==================================================================
        [ Restyle Checkbox ]*/

        .input-checkbox100 {
            display: none;
        }

        .label-checkbox100 {
            font-family: Poppins-Regular;
            font-size: 13px;
            color: #999999;
            line-height: 1.4;

            display: block;
            position: relative;
            padding-left: 26px;
            cursor: pointer;
        }

        .label-checkbox100::before {
            content: "\f00c";
            font-family: FontAwesome;
            font-size: 13px;
            color: transparent;

            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            width: 18px;
            height: 18px;
            border-radius: 2px;
            background: #fff;
            border: 1px solid #6675df;
            left: 0;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .input-checkbox100:checked + .label-checkbox100::before {
            color: #6675df;
        }


        /*------------------------------------------------------------------
        [ Button ]*/
        .container-login100-form-btn {
            width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .login100-form-btn {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            background: #1A0FAE;
            font-family: Montserrat-Bold;
            font-size: 12px;
            color: #fff;
            line-height: 1.2;
            text-transform: uppercase;
            letter-spacing: 1px;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

        .login100-form-btn:hover {
            background: #100E5C;
        }



        /*------------------------------------------------------------------
        [ Responsive ]*/

        @media (max-width: 992px) {
            .login100-form {
                width: 50%;
                padding-left: 30px;
                padding-right: 30px;
            }

            .login100-more {
                width: 50%;
            }
        }

        @media (max-width: 768px) {
            .login100-form {
                width: 100%;
            }

            .login100-more {
                display: none;
            }
        }

        @media (max-width: 576px) {
            .login100-form {
                padding-left: 15px;
                padding-right: 15px;
                padding-top: 70px;
            }
        }


        /*------------------------------------------------------------------
        [ Alert validate ]*/

        .validate-input {
            position: relative;
        }

        .alert-validate::before {
            content: attr(data-validate);
            position: absolute;
            z-index: 100;
            max-width: 70%;
            background-color: #fff;
            border: 1px solid #c80000;
            border-radius: 2px;
            padding: 4px 25px 4px 10px;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
            right: 12px;
            pointer-events: none;
            font-family: Poppins-Regular;
            color: #c80000;
            font-size: 13px;
            line-height: 1.4;
            text-align: left;
            visibility: hidden;
            opacity: 0;
            -webkit-transition: opacity 0.4s;
            -o-transition: opacity 0.4s;
            -moz-transition: opacity 0.4s;
            transition: opacity 0.4s;
        }

        .alert-validate::after {
            content: "\f12a";
            font-family: FontAwesome;
            display: block;
            position: absolute;
            z-index: 110;
            color: #c80000;
            font-size: 16px;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
            right: 18px;
        }

        .alert-validate:hover:before {
            visibility: visible;
            opacity: 1;
        }

        @media (max-width: 992px) {
            .alert-validate::before {
                visibility: visible;
                opacity: 1;
            }
        }



        /*==================================================================
        [ Social ]*/
        .login100-form-social-item {
            width: 36px;
            height: 36px;
            font-size: 18px;
            color: #fff;
            border-radius: 50%;
        }

        .login100-form-social-item:hover {
            background: #333333;
            color: #fff;
        }


        .panel-login {
            border-color: #ccc;
            -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
        }
        .panel-login>.panel-heading {
            color: #00415d;
            background-color: #fff;
            border-color: #fff;
            text-align:center;
        }
        .panel-login>.panel-heading a{
            text-decoration: none;
            color: #666;
            font-weight: bold;
            font-size: 15px;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            transition: all 0.1s linear;
        }
        .panel-login>.panel-heading a.active{
            color: #1A0FAE;
            font-size: 25px;
            font-family: 'Roboto Condensed', sans-serif;
        }
        .panel-login>.panel-heading hr{
            margin-top: 10px;
            margin-bottom: 0px;
            clear: both;
            border: 0;
            height: 1px;
            background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
            background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
        }

    </style>

    <script>
        $('.carousel').carousel()
        $(function() {

            $('#login-form-link').click(function(e) {
                $("#login-form").delay(100).fadeIn(100);
                $("#register-form").fadeOut(100);
                $('#register-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
            $('#register-form-link').click(function(e) {
                $("#register-form").delay(100).fadeIn(100);
                $("#login-form").fadeOut(100);
                $('#login-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });

        });
    </script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
      data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">

        <a class="navbar-brand text-center" href="${home}"> <img
                src="${images}/era.png" style="width: 35%;" /></a>

        <div class="collapse navbar-collapse" id="myNavbar"></div>
    </div>
</nav>

<div style="margin-top: 120px;">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-login">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-4 "></div>
                    <div class="col-xs-4 ">
                        <a href="#" class="active" id="login-form-link"> LOGIN</a>
                    </div>
                </div>
                <hr>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Email</span>
                        </div>


                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="pass">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Password</span>
                        </div>

                        <div class="flex-sb-m w-full p-t-3 p-b-32">


                            <div>
                                <a href="#" class="txt1">
                                    Forgot Password?
                                </a>
                            </div>
                        </div>


                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							or sign up using
						</span>
                        </div>

                        <div class="login100-form-social flex-c-m">
                            <a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
                                <i class="fa fa-facebook-f" aria-hidden="true"></i>
                            </a>

                            <a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


</body>
</html>
