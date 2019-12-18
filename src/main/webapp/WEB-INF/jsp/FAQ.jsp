<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24-Apr-19
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/img" var="images" />
<spring:url value="/erapay/login" var="login"/>
<spring:url value="/erapay/typeofsignup" var="signup"/>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <style>
        .navbar-fixed-top {
            background-color: #2F313E !important;
        }
        .navbar li a, .navbar .navbar-brand {
            color: #ff9c1d !important;
            font-family: 'Montserrat';
            font-weight: bold;
        }
        .navbar-nav li a:hover {
            border-bottom: 3px solid #283891;
        }
        .navbar-nav li.active a {

            background-color: transparent !important;
            border-bottom: 3px solid #283891;

        }
        .navbar-default .navbar-toggle {
            border-color: transparent;
        }
        .panel-group .panel {
            border-radius: 0;
            box-shadow: none;
            border-color: #EEEEEE;
        }

        .panel-default > .panel-heading {
            padding: 0;
            border-radius: 0;
            color: #212121;
            background-color: #FAFAFA;
            border-color: #EEEEEE;
        }

        .panel-title {
            font-size: 14px;
        }

        .panel-title > a {
            display: block;
            padding: 15px;
            text-decoration: none;
        }

        .more-less {
            float: right;
            color: #212121;
        }

        .panel-default > .panel-heading + .panel-collapse > .panel-body {
            border-top-color: #EEEEEE;
        }







        * {
            -webkit-border-radius: 1px !important;
            -moz-border-radius: 1px !important;
            border-radius: 1px !important;
        }
        #logo {
            color: #666;
            width:100%;
        }
        #logo h1 {
            font-size: 40px;
            text-shadow: 1px 2px 3px #999;
            font-family: Roboto, sans-serif;
            font-weight: 700;
            letter-spacing: -1px;
        }
        #logo p{
            padding-bottom: 10px;
        }


        #form-buscar >.form-group >.input-group > .form-control {
            height: 40px;
        }
        #form-buscar >.form-group >.input-group > .input-group-btn > .btn{
            height: 40px;
            font-size: 16px;
            font-weight: 300;


        }
        #form-buscar >.form-group >.input-group > .input-group-btn > .btn .glyphicon{
            margin-right:12px;
        }


        #form-buscar >.form-group >.input-group > .form-control {
            font-size: 16px;
            font-weight: 300;

        }

        #form-buscar >.form-group >.input-group > .form-control:focus {
            border-color: #33A444;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 1px rgba(0, 109, 0, 0.8);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 1px rgba(0, 109, 0, 0.8);
        }

        .demo {
            padding-top: 60px;
            padding-bottom: 60px;
        }
        .search {
            width: 100%;
            position: relative;
            display: flex;
        }

        .searchTerm {
            width: 100%;
            border: 3px solid #00B4CC;
            border-right: none;
            padding: 5px;
            height: 20px;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #9DBFAF;
        }

        .searchTerm:focus{
            color: #00B4CC;
        }

        .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid #00B4CC;
            background: #00B4CC;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
        }

        /*Resize the wrap to see the search bar change!*/
        .wrap{
            width: 30%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #custom-search-input {
            margin:0;
            margin-top: 10px;
            padding: 0;
        }

        #custom-search-input .search-query {
            width:100%;
            padding-right: 3px;
            padding-left: 15px;
            /* IE7-8 doesn't have border-radius, so don't indent the padding */
            margin-bottom: 0;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 0;
        }

        #custom-search-input button {
            border: 0;
            background: none;
            /** belows styles are working good */
            padding: 2px 5px;
            margin-top: 2px;
            position: absolute;
            right:0;
            /* IE7-8 doesn't have border-radius, so don't indent the padding */
            margin-bottom: 0;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            color:#D9230F;
            cursor: unset;
            z-index: 2;
        }

        .search-query:focus{
            z-index: 0;
        }
        @import url('https://fonts.googleapis.com/css?family=Hind:300,400');

        *, *:before, *:after {
            -webkit-box-sizing: inherit;
            box-sizing: inherit;
        }

        html {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Hind', sans-serif;
            background: #fff;
            color: #4d5974;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            min-height: 100vh;
        }



        h3 {
            font-size: 1.75rem;
            color: #373d51;
            padding: 1.3rem;
            margin: 0;
        }

        .accordion a {
            position: relative;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            width: 100%;
            padding: 1rem 3rem 1rem 1rem;
            color: #7288a2;
            font-size: 1.15rem;
            font-weight: 400;
            border-bottom: 1px solid #e5e5e5;
        }

        .accordion a:hover,
        .accordion a:hover::after {
            cursor: pointer;
            color: #03b5d2;
        }

        .accordion a:hover::after {
            border: 1px solid #03b5d2;
        }

        .accordion a.active {
            color: #03b5d2;
            border-bottom: 1px solid #03b5d2;
        }

        .accordion a::after {
            font-family: 'Ionicons';
            content: '\f218';
            position: absolute;
            float: right;
            right: 1rem;
            font-size: 1rem;
            color: #7288a2;
            padding: 5px;
            width: 30px;
            height: 30px;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            border: 1px solid #7288a2;
            text-align: center;
        }

        .accordion a.active::after {
            font-family: 'Ionicons';
            content: '\f209';
            color: #03b5d2;
            border: 1px solid #03b5d2;
        }

        .accordion .content {
            opacity: 0;
            padding: 0 1rem;
            max-height: 0;
            border-bottom: 1px solid #e5e5e5;
            overflow: hidden;
            clear: both;
            -webkit-transition: all 0.2s ease 0.15s;
            -o-transition: all 0.2s ease 0.15s;
            transition: all 0.2s ease 0.15s;
        }

        .accordion .content p {
            font-size: 1rem;
            font-weight: 300;
        }

        .accordion .content.active {
            opacity: 1;
            padding: 1rem;
            max-height: 100%;
            -webkit-transition: all 0.35s ease 0.15s;
            -o-transition: all 0.35s ease 0.15s;
            transition: all 0.35s ease 0.15s;
        }

    </style>
</head>
<body>



<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#myPage">  <img src="${images}/Era-Infotech-Ltd.-Logo1.png" style="width:60%;"/></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#myPage">HOME</a></li>
                <li><a href="#about">ABOUT</a></li>
                <li><a href="#services">SERVICES</a></li>
                <li><a href="#contact">CONTACT</a></li>
                <li><a href="${login}">LOGIN</a></li>
                <li><a href="${signup}">SIGNUP</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid" style="background-color: #E5EFE4;">
        <div class="container" style="margin-top: 8%;">
            <div class="col-md-6 col-md-offset-3">
                <div class="row">
                    <div id="logo" class="text-center">
                        <h1>How can we help you?</h1>
                    </div>
                    <form role="form" id="form-buscar">
                        <div class="form-group">
                            <div class="input-group">
                                <input id="1" class="form-control" type="text" name="search" placeholder="Search..." required/>
                                <span class="input-group-btn">
<button class="btn btn-success" type="submit">
<i class="glyphicon glyphicon-search" aria-hidden="true"></i> Search
</button>
</span>
                            </div>
                        </div>
                    </form>

                <div id="logo" class="text-center">
                   <p>You can also browse the topics below to find what you are looking for.</p>
                </div>
            </div>
        </div>
    </div>
    </div>
</nav>




<div class="col-md-8 col-md-offset-2" style="margin-top:400px">


    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <i class="more-less glyphicon glyphicon-plus"></i>
                        Collapsible Group Item #1
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <i class="more-less glyphicon glyphicon-plus"></i>
                        Collapsible Group Item #2
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        <i class="more-less glyphicon glyphicon-plus"></i>
                        Collapsible Group Item #3
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
            </div>
        </div>

    </div><!-- panel-group -->


</div>

<div class="container">

    <h2>Frequently Asked Questions</h2>

    <div class="accordion">
        <div class="accordion-item">
            <a>Why is the moon sometimes out during the day?</a>
            <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
            </div>
        </div>
        <div class="accordion-item">
            <a>Why is the sky blue?</a>
            <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
            </div>
        </div>
        <div class="accordion-item">
            <a>Will we ever discover aliens?</a>
            <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
            </div>
        </div>
        <div class="accordion-item">
            <a>How much does the Earth weigh?</a>
            <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
            </div>
        </div>
        <div class="accordion-item">
            <a>How do airplanes stay up?</a>
            <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
            </div>
        </div>
    </div>

</div>


</body>
</html>
