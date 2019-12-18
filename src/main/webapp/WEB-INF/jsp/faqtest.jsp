<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/img" var="images" />
<spring:url value="/erapay/login" var="login"/>
<spring:url value="/erapay/typeofsignup" var="signup"/>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script> <!-- Modernizr -->
    <title>FAQ </title>

    <style>
        .navbar-default {
            background-color: #2F313E !important;
            border-color: #E7E7E7;
        }
        .navbar-fixed-top {

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
            background-color: #2F313E !important;
        }
        /* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure,
        footer, header, hgroup, menu, nav, section, main {
            display: block;
        }
        body {
            line-height: 1;
        }
        ol, ul {
            list-style: none;
        }
        blockquote, q {
            quotes: none;
        }
        blockquote:before, blockquote:after,
        q:before, q:after {
            content: '';
            content: none;
        }
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }


        /* --------------------------------
        Primary style
        -------------------------------- */
        *, *::after, *::before {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        *::after, *::before {
            content: '';
        }

        body {
            font-size: 100%;
            font-family: "Open Sans", sans-serif;
            color: #4e5359;
            background-color: #f3f3f5;
        }
        body::after {
            /* overlay layer visible on small devices when the right panel slides in */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(78, 83, 89, 0.8);
            visibility: hidden;
            opacity: 0;
            -webkit-transition: opacity .3s 0s, visibility 0s .3s;
            -moz-transition: opacity .3s 0s, visibility 0s .3s;
            transition: opacity .3s 0s, visibility 0s .3s;
        }
        body.cd-overlay::after {
            visibility: visible;
            opacity: 1;
            -webkit-transition: opacity .3s 0s, visibility 0s 0s;
            -moz-transition: opacity .3s 0s, visibility 0s 0s;
            transition: opacity .3s 0s, visibility 0s 0s;
        }
        @media only screen and (min-width: 768px) {
            body::after {
                display: none;
            }
        }

        a {
            color: #a9c056;
            text-decoration: none;
        }

        /* --------------------------------
        Main components
        -------------------------------- */
        header {
            position: relative;
            height: 180px;
            line-height: 180px;
            text-align: center;
            background-color: #a9c056;
        }
        header h1 {
            color: #ffffff;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-size: 20px;
            font-size: 1.25rem;
        }
        @media only screen and (min-width: 1024px) {
            header {
                height: 240px;
                line-height: 240px;
            }
            header h1 {
                font-size: 36px;
                font-size: 2.25rem;
                font-weight: 300;
            }
        }

        .cd-faq {
            width: 90%;
            max-width: 1024px;
            margin: 2em auto;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
        }
        .cd-faq:after {
            content: "";
            display: table;
            clear: both;
        }
        @media only screen and (min-width: 768px) {
            .cd-faq {
                position: relative;
                margin: 4em auto;
                box-shadow: none;
            }
        }

        .cd-faq-categories a {
            position: relative;
            display: block;
            overflow: hidden;
            height: 50px;
            line-height: 50px;
            padding: 0 28px 0 16px;
            background-color: #18273a ;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            color: #ffffff;
            white-space: nowrap;
            border-bottom: 1px solid #555b61;
            text-overflow: ellipsis;
        }
        .cd-faq-categories a::before, .cd-faq-categories a::after {
            /* plus icon on the right */
            position: absolute;
            top: 50%;
            right: 16px;
            display: inline-block;
            height: 1px;
            width: 10px;
            background-color: #7f868e;
        }
        .cd-faq-categories a::after {
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
            -o-transform: rotate(90deg);
            transform: rotate(90deg);
        }
        .cd-faq-categories li:last-child a {
            border-bottom: none;
        }
        @media only screen and (min-width: 768px) {
            .cd-faq-categories {
                width: 20%;
                float: left;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
            }
            .cd-faq-categories a {
                font-size: 13px;
                font-size: 0.8125rem;
                font-weight: 600;
                padding-left: 24px;
                padding: 0 24px;
                -webkit-transition: background 0.2s, padding 0.2s;
                -moz-transition: background 0.2s, padding 0.2s;
                transition: background 0.2s, padding 0.2s;
            }

            .cd-faq-categories a::before, .cd-faq-categories a::after {
                display: none;
            }
            .no-touch .cd-faq-categories a:hover {
                background: #555b61;
            }
            .no-js .cd-faq-categories {
                width: 100%;
                margin-bottom: 2em;
            }
        }
        @media only screen and (min-width: 1024px) {
            .cd-faq-categories {
                position: absolute;
                top: 0;
                left: 0;
                width: 200px;
                z-index: 2;
            }
            .cd-faq-categories a::before {
                /* decorative rectangle on the left visible for the selected item */
                display: block;
                top: 0;
                right: auto;
                left: 0;
                height: 100%;
                width: 3px;
                background-color: #a9c056;
                opacity: 0;
                -webkit-transition: opacity 0.2s;
                -moz-transition: opacity 0.2s;
                transition: opacity 0.2s;
            }
            .cd-faq-categories .selected {
                background: #42464b !important;
            }
            .cd-faq-categories .selected::before {
                opacity: 1;
            }
            .cd-faq-categories.is-fixed {
                /* top and left value assigned in jQuery */
                position: fixed;
            }
            .no-js .cd-faq-categories {
                position: relative;
            }
        }

        .cd-faq-items {
            position: fixed;
            height: 100%;
            width: 90%;
            top: 0;
            right: 0;
            background: #ffffff;
            padding: 0 5% 1em;
            overflow: auto;
            -webkit-overflow-scrolling: touch;
            z-index: 1;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            -webkit-transform: translateZ(0) translateX(100%);
            -moz-transform: translateZ(0) translateX(100%);
            -ms-transform: translateZ(0) translateX(100%);
            -o-transform: translateZ(0) translateX(100%);
            transform: translateZ(0) translateX(100%);
            -webkit-transition: -webkit-transform .3s;
            -moz-transition: -moz-transform .3s;
            transition: transform .3s;
        }
        .cd-faq-items.slide-in {
            -webkit-transform: translateZ(0) translateX(0%);
            -moz-transform: translateZ(0) translateX(0%);
            -ms-transform: translateZ(0) translateX(0%);
            -o-transform: translateZ(0) translateX(0%);
            transform: translateZ(0) translateX(0%);
        }
        .no-js .cd-faq-items {
            position: static;
            height: auto;
            width: 100%;
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            -ms-transform: translateX(0);
            -o-transform: translateX(0);
            transform: translateX(0);
        }
        @media only screen and (min-width: 768px) {
            .cd-faq-items {
                position: static;
                height: auto;
                width: 78%;
                float: right;
                overflow: visible;
                -webkit-transform: translateZ(0) translateX(0);
                -moz-transform: translateZ(0) translateX(0);
                -ms-transform: translateZ(0) translateX(0);
                -o-transform: translateZ(0) translateX(0);
                transform: translateZ(0) translateX(0);
                padding: 0;
                background: transparent;
            }
        }
        @media only screen and (min-width: 1024px) {
            .cd-faq-items {
                float: none;
                width: 100%;
                padding-left: 220px;
            }
            .no-js .cd-faq-items {
                padding-left: 0;
            }
        }

        .cd-close-panel {
            position: fixed;
            top: 5px;
            right: -100%;
            display: block;
            height: 40px;
            width: 40px;
            overflow: hidden;
            text-indent: 100%;
            white-space: nowrap;
            z-index: 2;
            /* Force Hardware Acceleration in WebKit */
            -webkit-transform: translateZ(0);
            -moz-transform: translateZ(0);
            -ms-transform: translateZ(0);
            -o-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            -webkit-transition: right 0.4s;
            -moz-transition: right 0.4s;
            transition: right 0.4s;
        }
        .cd-close-panel::before, .cd-close-panel::after {
            /* close icon in CSS */
            position: absolute;
            top: 16px;
            left: 12px;
            display: inline-block;
            height: 3px;
            width: 18px;
            background: #6c7d8e;
        }
        .cd-close-panel::before {
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            transform: rotate(45deg);
        }
        .cd-close-panel::after {
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }
        .cd-close-panel.move-left {
            right: 2%;
        }
        @media only screen and (min-width: 768px) {
            .cd-close-panel {
                display: none;
            }
        }

        .cd-faq-group {
            /* hide group not selected */
            display: none;
        }
        .cd-faq-group.selected {
            display: block;
        }
        .cd-faq-group .cd-faq-title {
            background: transparent;
            box-shadow: none;
            margin: 1em 0;
        }
        .no-touch .cd-faq-group .cd-faq-title:hover {
            box-shadow: none;
        }
        .cd-faq-group .cd-faq-title h2 {
            text-transform: uppercase;
            font-size: 12px;
            font-size: 0.75rem;
            font-weight: 700;
            color: #bbbbc7;
        }
        .no-js .cd-faq-group {
            display: block;
        }
        @media only screen and (min-width: 768px) {
            .cd-faq-group {
                /* all groups visible */
                display: block;
            }
            .cd-faq-group > li {
                background: #ffffff;
                margin-bottom: 6px;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
                -webkit-transition: box-shadow 0.2s;
                -moz-transition: box-shadow 0.2s;
                transition: box-shadow 0.2s;
            }
            .no-touch .cd-faq-group > li:hover {
                box-shadow: 0 1px 10px rgba(108, 125, 142, 0.3);
            }
            .cd-faq-group .cd-faq-title {
                margin: 2em 0 1em;
            }
            .cd-faq-group:first-child .cd-faq-title {
                margin-top: 0;
            }
        }

        .cd-faq-trigger {
            position: relative;
            display: block;
            margin: 1.6em 0 .4em;
            line-height: 1.2;
        }
        @media only screen and (min-width: 768px) {
            .cd-faq-trigger {
                font-size: 24px;
                font-size: 1.5rem;
                font-weight: 300;
                margin: 0;
                padding: 24px 72px 24px 24px;
            }
            .cd-faq-trigger::before, .cd-faq-trigger::after {
                /* arrow icon on the right */
                position: absolute;
                right: 24px;
                top: 50%;
                height: 2px;
                width: 13px;
                background: #cfdca0;
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                -webkit-transition-property: -webkit-transform;
                -moz-transition-property: -moz-transform;
                transition-property: transform;
                -webkit-transition-duration: 0.2s;
                -moz-transition-duration: 0.2s;
                transition-duration: 0.2s;
            }
            .cd-faq-trigger::before {
                -webkit-transform: rotate(45deg);
                -moz-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                -o-transform: rotate(45deg);
                transform: rotate(45deg);
                right: 32px;
            }
            .cd-faq-trigger::after {
                -webkit-transform: rotate(-45deg);
                -moz-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                -o-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            .content-visible .cd-faq-trigger::before {
                -webkit-transform: rotate(-45deg);
                -moz-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                -o-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            .content-visible .cd-faq-trigger::after {
                -webkit-transform: rotate(45deg);
                -moz-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                -o-transform: rotate(45deg);
                transform: rotate(45deg);
            }
        }

        .cd-faq-content p {
            font-size: 14px;
            font-size: 0.875rem;
            line-height: 1.4;
            color: #6c7d8e;
        }
        @media only screen and (min-width: 768px) {
            .cd-faq-content {
                display: none;
                padding: 0 24px 30px;
            }
            .cd-faq-content p {
                line-height: 1.6;
            }
            .no-js .cd-faq-content {
                display: block;
            }
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

    </style>
</head>
<body>
<nav class="navbar navbar-default">
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
<section class="cd-faq">
    <ul class="cd-faq-categories">
        <li><a class="selected" href="#basics">Common Questions</a></li>
        <li><a href="#mobile">Account</a></li>
        <li><a href="#account">Privacy</a></li>
        <li><a href="#payments">EraPay Wallet Features</a></li>
        <li><a href="#privacy">Privacy</a></li>
        <li><a href="#delivery">Delivery</a></li>
    </ul> <!-- cd-faq-categories -->

    <div class="cd-faq-items">
        <ul id="basics" class="cd-faq-group">
            <li class="cd-faq-title"><h2>Common Question</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">How do I change my password?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae quidem blanditiis delectus corporis, possimus officia sint sequi ex tenetur id impedit est pariatur iure animi non a ratione reiciendis nihil sed consequatur atque repellendus fugit perspiciatis rerum et. Dolorum consequuntur fugit deleniti, soluta fuga nobis. Ducimus blanditiis velit sit iste delectus obcaecati debitis omnis, assumenda accusamus cumque perferendis eos aut quidem! Aut, totam rerum, cupiditate quae aperiam voluptas rem inventore quas, ex maxime culpa nam soluta labore at amet nihil laborum? Explicabo numquam, sit fugit, voluptatem autem atque quis quam voluptate fugiat earum rem hic, reprehenderit quaerat tempore at. Aperiam.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I sign up?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cupiditate et laudantium esse adipisci consequatur modi possimus accusantium vero atque excepturi nobis in doloremque repudiandae soluta non minus dolore voluptatem enim reiciendis officia voluptates, fuga ullam? Voluptas reiciendis cumque molestiae unde numquam similique quas doloremque non, perferendis doloribus necessitatibus itaque dolorem quam officia atque perspiciatis dolore laudantium dolor voluptatem eligendi? Aliquam nulla unde voluptatum molestiae, eos fugit ullam, consequuntur, saepe voluptas quaerat deleniti. Repellendus magni sint temporibus, accusantium rem commodi?</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">Can I remove a post?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">How do EraPay work?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->

        <ul id="mobile" class="cd-faq-group">
            <li class="cd-faq-title"><h2>Account</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">What type of account should I choose?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I sign up for a personal account?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi tempore, placeat quisquam rerum! Eligendi fugit dolorum tenetur modi fuga nisi rerum, autem officiis quaerat quos. Magni quia, quo quibusdam odio. Error magni aperiam amet architecto adipisci aspernatur! Officia, quaerat magni architecto nostrum magnam fuga nihil, ipsum laboriosam similique voluptatibus facilis nobis? Eius non asperiores, nesciunt suscipit veniam blanditiis veritatis provident possimus iusto voluptas, eveniet architecto quidem quos molestias, aperiam eum reprehenderit dolores ad deserunt eos amet. Vero molestiae commodi unde dolor dicta maxime alias, velit, nesciunt cum dolorem, ipsam soluta sint suscipit maiores mollitia assumenda ducimus aperiam neque enim! Quas culpa dolorum ipsam? Ipsum voluptatibus numquam natus? Eligendi explicabo eos, perferendis voluptatibus hic sed ipsam rerum maiores officia! Beatae, molestias!</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I sign up for a business account?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">How can I receive payment from clients through iPay business account?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">Can I change my account type?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">Can I create both types of account with one mobile number?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">Can I create both types of account with one National ID Card?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">How to link bank account to EraPay wallet?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->

        <ul id="account" class="cd-faq-group">
            <li class="cd-faq-title"><h2>Privacy</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">How do I change my password?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis earum autem consectetur labore eius tenetur esse, in temporibus sequi cum voluptatem vitae repellat nostrum odio perspiciatis dolores recusandae necessitatibus, unde, deserunt voluptas possimus veniam magni soluta deleniti! Architecto, quidem, totam. Fugit minus odit unde ea cupiditate ab aperiam sed dolore facere nihil laboriosam dolorum repellat deleniti aliquam fugiat laudantium delectus sint iure odio, necessitatibus rem quisquam! Ipsum praesentium quam nisi sint, impedit sapiente facilis laudantium mollitia quae fugiat similique. Dolor maiores aliquid incidunt commodi doloremque rem! Quaerat, debitis voluptatem vero qui enim, sunt reiciendis tempore inventore maxime quasi fugiat accusamus beatae modi voluptates iste officia esse soluta tempora labore quisquam fuga, cum. Sint nemo iste nulla accusamus quam qui quos, vero, minus id. Eius mollitia consequatur fugit nam consequuntur nesciunt illo id quis reprehenderit obcaecati voluptates corrupti, minus! Possimus, perspiciatis!</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I delete my account?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo tempore soluta, minus magnam non blanditiis dolore, in nam voluptas nobis minima deserunt deleniti id animi amet, suscipit consequuntur corporis nihil laborum facere temporibus. Qui inventore, doloribus facilis, provident soluta voluptas excepturi perspiciatis fugiat odit vero! Optio assumenda animi at! Assumenda doloremque nemo est sequi eaque, ipsum id, labore rem nisi, amet similique vel autem dolore totam facilis deserunt. Mollitia non ut libero unde accusamus praesentium sint maiores, illo, nemo aliquid?</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I change my account settings?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">I forgot my password. How do I reset it?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum at aspernatur iure facere ab a corporis mollitia molestiae quod omnis minima, est labore quidem nobis accusantium ad totam sunt doloremque laudantium impedit similique iste quasi cum! Libero fugit at praesentium vero. Maiores non consequuntur rerum, nemo a qui repellat quibusdam architecto voluptatem? Sequi, possimus, cupiditate autem soluta ipsa rerum officiis cum libero delectus explicabo facilis, odit ullam aperiam reprehenderit! Vero ad non harum veritatis tempore beatae possimus, ex odio quo.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->

        <ul id="payments" class="cd-faq-group">
            <li class="cd-faq-title"><h2>EraPay Wallet Features</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">Make payment</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">Send or Request Money</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">Add or withdraw money</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">Mobile Top-Up</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
            <li>
                <a class="cd-faq-trigger" href="#0">Scan to Pay</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->

        <ul id="privacy" class="cd-faq-group">
            <li class="cd-faq-title"><h2>Privacy</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">Can I specify my own private key?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">My files are missing! How do I get them back?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How can I access my account data?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus magni vero deserunt enim et quia in aliquam, rem tempore voluptas illo nisi veritatis quas quod placeat ipsa! Error qui harum accusamus incidunt at libero ipsum, suscipit dolorum esse explicabo in eius voluptates quidem voluptatem inventore amet eaque deserunt veniam dignissimos excepturi? Dolore, quo amet nostrum autem nemo. Sit nam assumenda, corporis ea sunt distinctio nostrum doloribus alias, beatae nesciunt dolore saepe consequuntur minima eveniet porro dolor officiis maiores ab obcaecati officia enim aliquam. Itaque fuga molestiae hic accusantium atque corporis quia id sequi enim vero? Hic aperiam sint facilis aliquam quia, accusamus tenetur earum totam enim est, error. Iusto, reiciendis necessitatibus molestias. Voluptatibus eos explicabo repellat nesciunt nam vero minima.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How can I control if other search engines can link to my profile?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->

        <ul id="delivery" class="cd-faq-group">
            <li class="cd-faq-title"><h2>Delivery</h2></li>
            <li>
                <a class="cd-faq-trigger" href="#0">What should I do if my order hasn't been delivered yet?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How can I find your international delivery information?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">Who takes care of shipping?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do returns or refunds work?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How do I use shipping profiles?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How does your UK Next Day Delivery service work?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">How does your Next Day Delivery service work?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">When will my order arrive?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>

            <li>
                <a class="cd-faq-trigger" href="#0">When will my order ship?</a>
                <div class="cd-faq-content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
                </div> <!-- cd-faq-content -->
            </li>
        </ul> <!-- cd-faq-group -->
    </div> <!-- cd-faq-items -->
    <a href="#0" class="cd-close-panel">Close</a>
</section> <!-- cd-faq -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
    jQuery(document).ready(function($){
        //update these values if you change these breakpoints in the style.css file (or _layout.scss if you use SASS)
        var MqM= 768,
            MqL = 1024;

        var faqsSections = $('.cd-faq-group'),
            faqTrigger = $('.cd-faq-trigger'),
            faqsContainer = $('.cd-faq-items'),
            faqsCategoriesContainer = $('.cd-faq-categories'),
            faqsCategories = faqsCategoriesContainer.find('a'),
            closeFaqsContainer = $('.cd-close-panel');

        //select a faq section
        faqsCategories.on('click', function(event){
            event.preventDefault();
            var selectedHref = $(this).attr('href'),
                target= $(selectedHref);
            if( $(window).width() < MqM) {
                faqsContainer.scrollTop(0).addClass('slide-in').children('ul').removeClass('selected').end().children(selectedHref).addClass('selected');
                closeFaqsContainer.addClass('move-left');
                $('body').addClass('cd-overlay');
            } else {
                $('body,html').animate({ 'scrollTop': target.offset().top - 20}, 400);
            }
        });

        //close faq lateral panel - mobile only
        $('body').bind('click touchstart', function(event){
            if( $(event.target).is('body.cd-overlay') || $(event.target).is('.cd-close-panel')) {
                closePanel(event);
            }
        });
        faqsContainer.on('swiperight', function(event){
            closePanel(event);
        });

        //show faq content clicking on faqTrigger
        faqTrigger.on('click', function(event){
            event.preventDefault();
            $(this).next('.cd-faq-content').slideToggle(200).end().parent('li').toggleClass('content-visible');
        });

        //update category sidebar while scrolling
        $(window).on('scroll', function(){
            if ( $(window).width() > MqL ) {
                (!window.requestAnimationFrame) ? updateCategory() : window.requestAnimationFrame(updateCategory);
            }
        });

        $(window).on('resize', function(){
            if($(window).width() <= MqL) {
                faqsCategoriesContainer.removeClass('is-fixed').css({
                    '-moz-transform': 'translateY(0)',
                    '-webkit-transform': 'translateY(0)',
                    '-ms-transform': 'translateY(0)',
                    '-o-transform': 'translateY(0)',
                    'transform': 'translateY(0)',
                });
            }
            if( faqsCategoriesContainer.hasClass('is-fixed') ) {
                faqsCategoriesContainer.css({
                    'left': faqsContainer.offset().left,
                });
            }
        });

        function closePanel(e) {
            e.preventDefault();
            faqsContainer.removeClass('slide-in').find('li').show();
            closeFaqsContainer.removeClass('move-left');
            $('body').removeClass('cd-overlay');
        }

        function updateCategory(){
            updateCategoryPosition();
            updateSelectedCategory();
        }

        function updateCategoryPosition() {
            var top = $('.cd-faq').offset().top,
                height = jQuery('.cd-faq').height() - jQuery('.cd-faq-categories').height(),
                margin = 20;
            if( top - margin <= $(window).scrollTop() && top - margin + height > $(window).scrollTop() ) {
                var leftValue = faqsCategoriesContainer.offset().left,
                    widthValue = faqsCategoriesContainer.width();
                faqsCategoriesContainer.addClass('is-fixed').css({
                    'left': leftValue,
                    'top': margin,
                    '-moz-transform': 'translateZ(0)',
                    '-webkit-transform': 'translateZ(0)',
                    '-ms-transform': 'translateZ(0)',
                    '-o-transform': 'translateZ(0)',
                    'transform': 'translateZ(0)',
                });
            } else if( top - margin + height <= $(window).scrollTop()) {
                var delta = top - margin + height - $(window).scrollTop();
                faqsCategoriesContainer.css({
                    '-moz-transform': 'translateZ(0) translateY('+delta+'px)',
                    '-webkit-transform': 'translateZ(0) translateY('+delta+'px)',
                    '-ms-transform': 'translateZ(0) translateY('+delta+'px)',
                    '-o-transform': 'translateZ(0) translateY('+delta+'px)',
                    'transform': 'translateZ(0) translateY('+delta+'px)',
                });
            } else {
                faqsCategoriesContainer.removeClass('is-fixed').css({
                    'left': 0,
                    'top': 0,
                });
            }
        }

        function updateSelectedCategory() {
            faqsSections.each(function(){
                var actual = $(this),
                    margin = parseInt($('.cd-faq-title').eq(1).css('marginTop').replace('px', '')),
                    activeCategory = $('.cd-faq-categories a[href="#'+actual.attr('id')+'"]'),
                    topSection = (activeCategory.parent('li').is(':first-child')) ? 0 : Math.round(actual.offset().top);

                if ( ( topSection - 20 <= $(window).scrollTop() ) && ( Math.round(actual.offset().top) + actual.height() + margin - 20 > $(window).scrollTop() ) ) {
                    activeCategory.addClass('selected');
                }else {
                    activeCategory.removeClass('selected');
                }
            });
        }
    });
</script>
</body>
</html>