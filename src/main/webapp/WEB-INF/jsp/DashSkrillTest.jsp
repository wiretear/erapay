<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26-Feb-19
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
    <spring:url value="/img" var="images" />
    <spring:url value="/table/css/main.css" var="tablecss" />
    <spring:url value="/table/css/util.css" var="tablecss1" />
    <spring:url value="/table/fonts/font-awesome-4.7.0/css/font-awesome.min.css" var="tablecss2" />
    <spring:url value="/table/images/icons/favicon.ico" var="tablecss3" />
    <spring:url value="/table/vendor/animate/animate.css" var="tablecss4" />
    <spring:url value="/table/vendor/select2/select2.min.css" var="tablecss5" />
    <spring:url value="/table/vendor/perfect-scrollbar/perfect-scrollbar.css" var="tablecss6" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${tablecss}" rel="stylesheet" type="text/css" media="all"/>
    <link href="${tablecss1}" rel="stylesheet" type="text/css" media="all"/>
    <link href="${tablecss2}" rel="stylesheet" type="text/css" media="all"/>
    <link href="${tablecss3}" rel="stylesheet" type="text/css" media="all"/>
    <link href="${tablecss4}" rel="stylesheet" type="text/css" media="all"/>
    <link href="${tablecss6}" rel="stylesheet" type="text/css" media="all"/>

</head>
<style>
    a:focus,a:hover,a{
        outline:none;
        text-decoration: none;
    }
    li,ul{
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .header-top i {
        font-size: 18px;
    }
    .bg-image {
        background: url(../images/background-login.jpg) no-repeat 0 0 / cover;
        position: relative;
        width: 100%;
        height: 100vh;
        display: table;
    }

    .login-header {
        display: inline-block;
        width: 100%;
        background: #0e1a35;
    }

    .login-signup {
        display: table-cell;
        vertical-align: middle;
        width: 100%;
    }

    .login-logo img {
        cursor: pointer;
        max-width: 171px;
        padding: 23px 15px 22px;
        width: 100%;
    }

    .login-header .navbar-right {
        margin-right: 0px;
    }

    .login-header .nav-tabs > li.active > a,
    .login-header .nav-tabs > li.active > a:focus,
    .login-header .nav-tabs > li.active > a:hover {
        background-color: transparent;
        border: none;
        color: #fff;
    }

    .login-header .nav-tabs > li > a {
        border: medium none;
        border-radius: 0;
        font-size: 14px;
        font-weight: 500;
        line-height: 48px;
        padding: 15px 30px;
        color: #fff;
    }

    .login-header .nav-tabs {
        border-bottom: none;
    }

    .login-header .nav-tabs > li {
        margin-bottom: 0px;
    }

    .login-header .nav > li > a:focus,
    .login-header .nav > li > a:hover {
        background: none;
        text-decoration: none;
    }

    .login-header .nav-tabs > li.active {
        border-bottom: 6px solid #5584ff;
    }

    .login-inner h1 {
        color: #8492af;
        font-size: 48px;
        font-weight: 300;
        text-align: center;
        margin-top: 0;
        margin-bottom: 20px;
    }

    .login-inner h1 span {
        color: #5584ff;
    }

    .login-form {
        text-align: center;
    }

    .login-form input {
        -moz-border-bottom-colors: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border-color: -moz-use-text-color -moz-use-text-color #d4d9e3;
        border-image: none;
        border-style: none none solid;
        border-width: medium medium 1px;
        font-size: 13px;
        font-weight: 300;
        width: 100%;
        color: #8492af;
        padding: 15px 50px;
        font-size: 17px;
        max-width: 550px;
    }

    .login-form label {
        margin-bottom: 30px;
        width: 100%;
    }

    .user input {
        background: rgba(0, 0, 0, 0) url("../images/user.png") no-repeat scroll 7px 12px;
    }

    .pass input {
        background: rgba(0, 0, 0, 0) url("../images/password.png") no-repeat scroll 7px 12px;
    }

    .mail input {
        background: rgba(0, 0, 0, 0) url("../images/mail.png") no-repeat scroll 4px 12px;
    }

    .login-signup .tab-content {
        background: #ffffff none repeat scroll 0 0;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);
        display: inline-block;
        margin-top: -8px;
        width: 100%;
    }

    .form-btn {
        background: #5584ff none repeat scroll 0 0;
        border: medium none;
        border-radius: 100px;
        color: #ffffff;
        font-weight: 400;
        max-width: 250px;
        padding: 10px 0;
        position: relative;
        width: 100%;
        margin: 40px 0;
        box-shadow: 0 2px 8px #d2d2d2;
        -moz-box-shadow: 0 2px 8px #d2d2d2;
        -webkit-box-shadow: 0 2px 8px #d2d2d2;
    }

    .form-btn::before {
        content: "";
        font-family: FontAwesome;
        position: absolute;
        right: 17px;
        top: 9px;
    }

    .form-details {
        padding: 35px 0;
    }

    .tab-content .tab-pane {
        padding: 70px 0;
    }


    /*Login Signup Page*/


    /*Home Page*/

    .home {
        background: #F5F7FB;
    }

    #navigation {
        background-color:#0E1A35;
    }

    #navigation {
        padding: 0;
    }

    .display-table {
        display: table;
        padding: 0;
        height: 50%;
        width: 100%;
    }

    .display-table-row {
        display: table-row;
        height: 100%;
    }

    .display-table-cell {
        display: table-cell;
        float: none;
        height: 100%;
    }

    .v-align {
        vertical-align: top;
    }
    .logo img {
        max-width: 180px;
        padding: 16px 0 17px;
        width: 100%;
    }

    .header-top {
        margin: 0;
        padding-top: 0px;
    }

    .header-top img {

        max-width: 30px !important;
        width: 100%;
    }

    .add-project {
        background: #5584ff none repeat scroll 0 0;
        border-radius: 0px;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        padding: 10px 27px 10px 45px;
        position: relative;
    }

    .header-rightside .nav > li > a:focus,
    .header-rightside .nav > li > a:hover {
        background: none;
        text-decoration: none;
    }

    .add-project::before {
        background: rgba(0, 0, 0, 0) url("../images/plus.png") no-repeat scroll 0 0;
        content: "";
    ;
        height: 12px;
        left: 17px;
        position: absolute;
        top: 12px;
        width: 12px;
    }

    .add-project:hover {
        color: #ffffff;
    }

    .header-top i {
        color: #0e1a35;
    }

    .icon-info {
        position: relative;
    }
    .navi i {
        font-size: 10px;
    }
    .label.label-primary {
        border-radius: 50%;
        font-size: 9px;
        left: 8px;
        position: absolute;
        top: -9px;
    }

    .icon-info .label {
        border: 2px solid #ffffff;
        font-weight: 500;
        padding: 3px 5px;
        text-align: center;
    }

    .header-top li {
        display: inline-block;
        text-align: center;
    }

    .header-top .dropdown-toggle {
        color: #0e1a35;
    }

    .header-top .dropdown-menu {
        border: medium none;
        left: -85px;
        padding: 17px;
    }
    .view {
        background: #5584ff none repeat scroll 0 0;
        border-radius: 100px;
        color: #ffffff;
        display: inline-block;
        font-size: 14px;
        font-weight: 600;
        margin-top: 10px;
        padding: 10px 15px;
    }

    .navbar-content > span {
        font-size: 13px;
        font-weight: 700;
    }

    .img-responsive {
        width: 100%;
    }
    #navigation{
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }
    .search input {
        border: none;
        font-size: 15px;
        padding: 15px 9px;
        width: 100%;
        background: rgba(0, 0, 0, 0) url("../images/search.png") no-repeat scroll 99% 12px;
        color: #8492af;
    }

    header {
        background: #ffffff none repeat scroll 0 0;
        box-shadow: 0 1px 12px rgba(0, 0, 0, 0.04);
        display: inline-block !important;
        line-height: 13px;
        padding: 10px;
        transition: all 0.5s ease 0s;
        width: 100%;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    .logo {
        text-align: center;
    }

    .navi a {
        border-bottom: 1px solid #0d172e;
        border-top: 1px solid #0d172e;
        color: #ffffff;
        display: block;
        font-size: 17px;
        font-weight: 500;
        padding: 15px 15px;
        text-decoration: none;
    }

    .navi i {
        margin-right: 15px;
        color: #5584ff;
    }

    .navi .active a {
        background: #122143;
        border-left: 5px solid #5584ff;
        padding-left: 15px;
    }

    .navi a:hover {
        background: #122143 none repeat scroll 0 0;
        border-left: 5px solid #5584ff;
        display: block;
        padding-left: 15px;
    }

    .navbar-default {
        background-color: #122643;

    }

    .navbar-toggle {
        border: none;
    }

    .navbar-default .navbar-toggle:focus,
    .navbar-default .navbar-toggle:hover {
        background-color: rgba(0, 0, 0, 0);
    }

    .navbar-default .navbar-toggle .icon-bar {
        background-color: #0e1a35;
    }

    .circle-logo {
        margin: 0 auto;
        max-width: 30px !important;
        text-align: center;
    }
    .hidden-xs{
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    .user-dashboard {
        padding: 0 20px;
    }

    .user-dashboard h1 {
        color: #0e1a35;
        font-size: 30px;
        font-weight: 500;
        margin: 0;
        padding: 21px 0;
    }
    .sales {
        background: #ffffff;
        border: 1px solid #d4d9e3;


    }
    .sales button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: 1px solid #dadee7;
        border-radius: 100px;
        font-size: 15px;
        letter-spacing: 0.5px;
        padding-right: 32px;
        color: #0e1a35;
    }

    .sales button::before {
        content: "";
        font-family: FontAwesome;
        position: absolute;
        right: 12px;
        top: 11px;
    }
    .sales  .btn-group {
        float: right;
    }
    .sales h2 {
        color: #8492af;

        font-size: 21px;
        font-weight: 600;
        margin: 0;
        padding: 4px 0 0;
    }

    .btn.btn-secondary.btn-lg.dropdown-toggle > span {
        font-size: 15px;
        font-weight: 600;
        letter-spacing: 0.5px;
    }
    .sales .dropdown-menu{
        margin: 0px;
        padding: 0px;
        border: 0px;
        border-radius: 8px;
        width: 100%;
        color: #0e1a35;
    }
    .sales .btn-group.open .dropdown-toggle, .btn.active, .btn:active{
        box-shadow: none;
    }
    .sales .dropdown-menu > a {
        color: #0e1a35;
        display: inline-block;
        font-weight: 800;
        padding: 9px 0;
        text-align: center;
        width: 100%;
    }
    #my-cool-chart svg {
        width: 100%;
    }
    .sales .dropdown-menu > a:hover{
        color: #5584FF;
    }
    .shield-buttons {
        display: none;
    }
    .close, .close:focus, .close:hover {
        color: #fff;;
        opacity: 1;
        text-shadow: none;
    }
    .modal-body input {
        border: 1px solid #d4d9e3;
        font-size: 14px;
        font-weight: 300;
        margin: 5px 0;
        padding: 14px 10px;
        width: 100%;
        color: #8492af;
    }
    .modal-body textarea {
        border: 1px solid #d4d9e3;
        font-size: 14px;
        font-weight: 300;
        height: 200px;
        margin-top: 5px;
        padding: 9px 10px;
        width: 100%;
        color: #8492af;
    }
    .modal-header.login-header h4 {
        color: #ffffff;
    }
    .modal-footer .add-project {
        background: #5584ff none repeat scroll 0 0;
        border: medium none;
        border-radius: 100px;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        padding: 10px 30px;
        position: relative;
    }
    .modal-footer .add-project::before{display: none;}
    .modal-footer {
        border: 0 none;
        padding: 10px 15px 26px;
        text-align: right;
    }
    .cancel {
        background: #0E1A35     ;
        border: medium none;
        border-radius: 100px;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        padding: 10px 30px;
        position: relative;

    }
    .headcolor h5 {
        color: #8492af!important;
    }

    .headcolor span {
        color: #223a6f;

    }
    .modal{
        top: 20%;
    }
    .modal-header .close {
        margin-top: 2px;
    }
    .search input:focus{
        border-bottom: 1px solid #BDC4D4;
        line-height:22px;
        transition: 0.1s all;
    }
    .modal-header.login-header {
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    /*Main CSS*/
    @media only screen and (max-device-width: 767px) {
        .login-logo img {
            margin: 0 auto;
        }
        .login-details .nav-tabs > li {
            text-align: center;
            width: 50%;
        }
        .login-signup .login-inner h1 {
            font-size: 26px;
            margin-bottom: 0;
            margin-top: 10px;
        }
        .login-inner .login-form input {
            font-size: 15px;
            max-width: 100%;
            padding: 15px 45px;
        }
        .login-inner .form-details {
            padding: 25px;
        }
        .login-inner .login-form label {
            margin-bottom: 20px;
            width: 100%;
        }
        .login-inner .form-btn {
            margin: 0;
            max-width: 180px;
        }
        .tab-content .tab-pane {
            padding: 20px 0;
        }
        #navigation .navi a {
            font-size: 14px;
            padding: 10px;
            text-align: center;
        }
        #navigation .navi i {
            margin-right: 0px;
        }
        #navigation .navi a:hover,
        #navigation .navi .active a {
            background: #122143 none repeat scroll 0 0;
            border-left: none;
            display: block;
            padding-left: 20px;
        }
        header .header-top img {
            max-width: 38px !important;
        }
        .v-align header {
            padding: 12px 15px;
        }
        header .header-top li {
            padding-left: 13px;
            padding-right: 6px;
        }
        .navbar-default .navbar-toggle {
            border-color: rgba(0, 0, 0, 0);
        }
        .navbar-header .navbar-toggle {
            float: left;
            margin: 0;
            padding: 0;
            top: 12px;
        }
        button,
        html [type="button"],
        [type="reset"],
        [type="submit"] {
            outline: medium none;
        }
        .user-dashboard .sales h2 {
            color: #8492af;
            float: left;
            font-size: 14px;
            font-weight: 600;
            margin: 0;
            padding: 13px 0 0;
        }

        .user-dashboard .btn.btn-secondary.btn-lg.dropdown-toggle > span {
            font-size: 11px;
        }
        .user-dashboard .sales button {
            font-size: 11px;
            padding-right: 23px;
        }
        .user-dashboard .sales h2 {
            font-size: 12px;
        }
        .user-dashboard .sales h3 {
            font-size: 8px;
        }

        .gutter{
            padding: 0;
        }
    }
    @media only screen and (max-device-width: 992px) {
        header .header-top li {
            padding-left: 20px !important;
            padding-right: 0;
        }
        header .logo img {
            max-width: 125px !important;
        }

    }

    @media only screen and (min-device-width: 767px) and (max-device-width: 998px){
        .user-dashboard .header-top {
            padding-top: 5px;
        }
        .user-dashboard .header-rightside {
            display: inline-block;
            float: left;
            width: 100%;
        }
        .user-dashboard .header-rightside .header-top img {
            max-width: 41px !important;
        }
        .user-dashboard .sales button {
            font-size: 10px;
        }
        .user-dashboard .btn.btn-secondary.btn-lg.dropdown-toggle > span {
            font-size: 12px;
        }
        .user-dashboard .sales h2 {
            font-size: 15px;
        }
    }
    .header
    {
        background-color: #0a1b3e;
    }
    @media only screen and (min-device-width:998px) and (max-device-width: 1350px){
        #navigation .logo img {
            max-width: 130px;
            padding: 16px 0 17px;
            width: 100%;
        }
    }
    .profile-info {
        background: transparent;
        padding: 15px 15px 10px 20px;
        display: flex;
    }
    .profile-image {
        padding-right: 5px;
        display: inline-block;
    }
    .profile-info .profile-image img {
        height: 65px;
        width: 65px;
        float: right;
        top: 5px;
        left: 5px;
        position: relative;
    }
    a[data-toggle="collapse"] {
        position: relative;
    }

    .dropdown-toggle::after {
        display: block;
        position: absolute;
        top: 50%;
        right: 20px;
        transform: translateY(-50%);
    }

    ul ul a {
        font-size: 0.9em !important;
        padding-left: 30px !important;
        background: #6d7fcc;
    }

    ul.CTAs {
        padding: 20px;
    }

    ul.CTAs a {
        text-align: center;
        font-size: 0.9em !important;
        display: block;
        border-radius: 5px;
        margin-bottom: 5px;
    }

    a.download {
        background: #fff;
        color: #7386D5;
    }
    .btn-primary {
        color: #fff;
        background-color: #021c52 !important;
        border-color: #0a1b3e !important;
    }


    a.article,
    a.article:hover {
        background: #6d7fcc !important;
        color: #fff !important;
    }

    /* ---------------------------------------------------
        CONTENT STYLE
    ----------------------------------------------------- */

    #content {
        width: 100%;
        padding: 20px;
        min-height: 100vh;
        transition: all 0.3s;
    }

    /* ---------------------------------------------------
        MEDIAQUERIES
    ----------------------------------------------------- */

    @media (max-width: 768px) {
        #sidebar {
            margin-left: -250px;
        }
        #sidebar.active {
            margin-left: 0;
        }

        #sidebarCollapse span {
            display: none;
        }
</style>
<script>
    $(document).ready(function(){
        $('[data-toggle="offcanvas"]').click(function(){
            $("#navigation").toggleClass("hidden-xs");
        });
    });
</script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<body class="home">
<div class="container-fluid display-table">
    <div class="row display-table-row">
        <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
            <div class="logo">
                <img src="${images}/Era-Infotech-Ltd.-Logo1.png" style="width:40%;"/>
                </a>
                <div class="profile-info row ">
                    <div class="profile-image ">
                        <a href="ui-profile.html">
                        </a>
                    </div>
                    <div class="profile-details">
                        <h3>
                            <a href="ui-profile.html">Shane Taylor</a>
                        </h3>
                        <p class="profile-title">Web Developer</p>
                    </div>
                </div>
            </div>
            <div class="navi">
                <ul>
                    <li>
                        <a href="/erapay/testhome" data-toggle="collapse" data-target="#submenu-1">Home</a>
                    </li>
                    <li>
                        <a href="/erapay/walletopen">Wallet Open</a>
                    </li>

                    <li>
                        <a href="/erapay/kycnew">KYC</a>
                    </li>
                    <li>
                        <a href="/erapay/addbankhome">Add Bank Account</a>
                    </li>
                    <li>
                        <a href="/erapay/requestmoney">Request Money</a>
                    </li>

                    <li>
                        <a href="/erapay/setpincode">Set PIN</a>
                    </li>
                    <li>
                        <a href="/erapay/changepassword">Change Password</a>
                    </li>
                    <li>
                        <a href="/erapay/wallettomerchanpayment">Wallet to Merchant Payment</a>
                    </li>
                    <li>
                        <a href="/erapay/transctionenqury">Transaction History</a>
                    </li>
                    <li>
                        <a href="/erapay/dynamicqrcode">Dynamic Qrcode</a>
                    </li>
                    <li><a href="/erapay/login">LogOut</a></li>
                    <li class="active">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">Home 1</a>
                            </li>
                            <li>
                                <a href="#">Home 2</a>
                            </li>
                            <li>
                                <a href="#">Home 3</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 col-sm-11 display-table-cell v-align">
            <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
            <div class="row">
                <header style="background-color:#FFFFFF">
                    <nav class="navbar-default pull-left">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </nav>
                    <div>
                        <div class="col-md-9">
                            </div>


                        <div  class="col-md-3">
                            <ul class="list-inline header-top">
                                <li class="hidden-xs">  </li>
                                <li class="hidden-xs">  </li>
                                    <li>
                                        <div style="margin-left: 55px;"><img  src="${images}/wallet.png"/>
                                           <span style="color: #CACACA"><b>Epay Balance</b> </span> <br> &nbsp; &nbsp; &nbsp;<b>Tk 10000</b></div>

                                    </li>


                            </ul>
                            </li>
                            </ul>
                        </div>

                    </div>
                </header>
            </div>
            <div class="user-dashboard">
                <br>


                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                           <h1 class="text-center">Make deposit to your wallet</h1>
                            <div class="col-md-12">
                                <div class="col-md-2 ">

                                </div>
                                <div class="col-md-4 ">
                                    <img src="${images}/wallet.png" />
                                </div>

                                <div   class="col-md-4">


                                    <a  style="margin-top: 4em"  type="button" id="introducerbtn" href="/erapay/kycintroducerinfo" class="btn btn-block btn-primary" >ADD Money</a>
                                </div>
                            </div>



                        </div>
                    </div>
                    </div>
            <div class="row">
                        <div class= "col-md-8 col-md-offset-2" style="margin-right: 4%">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <h1 class="text-center">Send money</h1>
                                    <div class="col-md-12">

                                        <div   class="col-md-8 col-md-offset-3">
                                            <img  class="text-center" src="${images}/envelope.png" style="width: 50%" />
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-center">
                                        <p>Send money to family, friends or anyone in the world</p>
                                        <div  style="margin-top: 2em" class="col-md-10  col-md-offset-1">


                                            <a   type="button" id="introducerbtn" href="/erapay/kycintroducerinfo" class="btn btn-block btn-primary" >Send Money</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default" >
                                <div class="panel-body">
                                    <h1 class="text-center">Mobile Recharge</h1>
                                    <div class="col-md-12">

                                        <div   class="col-md-8 col-md-offset-3">
                                            <img  class="text-center" src="${images}/online-payment.png" style="width: 50%" />
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-center">
                                        <p>Recharge any mobile number in moments without going anywhere.</p>
                                        <div  style="margin-top: 2em" class="col-md-10  col-md-offset-1">


                                            <a   type="button" id="introducerbtn" href="/erapay/kycintroducerinfo" class="btn btn-block btn-primary" >Recharge</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>

            </div>

                </div>
                </div>




        <!-- Modal -->



</body>
</html>
