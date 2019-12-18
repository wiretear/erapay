<!DOCTYPE html>
<html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Collapsible sidebar using Bootstrap 3</title>

    <!-- Bootstrap CSS CDN -->

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
    <!-- Our Custom CSS --><style>
    /*
    DEMO STYLE
*/

    @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
    body {
        font-family: 'Poppins', sans-serif;
        background: #F5F7FB;
    }

    p {
        font-family: 'Poppins', sans-serif;
        font-size: 1.1em;
        font-weight: 300;
        line-height: 1.7em;
        color: #999;
    }

    a,
    a:hover,
    a:focus {
        color: inherit;
        text-decoration: none;
        transition: all 0.3s;
    }

    .navbar {

        background: #fff;
        border: none;
        border-radius: 0;

        box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    .navbar-btn {
        box-shadow: none;
        outline: none !important;
        border: none;
    }

    .line {
        width: 100%;
        height: 1px;
        border-bottom: 1px dashed #ddd;
        margin: 40px 0;
    }

    /* ---------------------------------------------------
        SIDEBAR STYLE
    ----------------------------------------------------- */

    .wrapper {
        display: flex;
        width: 100%;

    }

    #sidebar {
        min-width: 250px;
        max-width: 250px;
        background: #132261;
        color: #fff;
        transition: all 0.3s;
        min-height: 80vh;
    }

    #sidebar.active {
        margin-left: -250px;
    }

    #sidebar .sidebar-header {
        padding: 20px;
        background: #06175d;
    }

    #sidebar ul.components {
        padding: 20px 0;
        border-bottom: 1px solid #132261;
    }

    #sidebar ul p {
        color: #fff;
        padding: 10px;
    }

    #sidebar ul li a {
        padding: 10px;
        font-size: 1.1em;
        display: block;
    }

    #sidebar ul li a:hover {
        color: #132261;
        background: #fff;
    }

    #sidebar ul li.active>a,
    a[aria-expanded="true"] {
        color: #fff;
        background: #132261;
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
        background: #132261;
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

        font-size: 15px;
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
    .headcolor span
    {
        color: #132261;
    }
</style>
</head>
<body >



<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header" >
            <img  id="image" style="margin-left:42px;"  src=" " class="img-circle" alt="Random Name" width="130" height="130">
            <h4 style="color:white;" class="text-center">Himel</h4>
            <h6 style="color:white;" class="text-center">Wallet ID: WL10000</h6>
        </div>
        <ul class="list-unstyled ">

            <li>
                <a href="/erapay/testhome" data-toggle="collapse" data-target="#submenu-1">Home</a>
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
                <a href="/erapay/transctionenqury">Transaction History</a>
            </li>
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Security</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">

                    <li>
                        <a href="/erapay/changepassword">Change Password</a>
                    </li>


                    <li>
                        <a href="/erapay/setpincode">Set PIN</a>
                    </li>
                </ul>
            </li>

            <li><a href="/erapay/login">LogOut</a></li>
        </ul>
    </nav>

    <!-- Page Content Holder -->
    <div id="content">

        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>

                    </button>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-credit-card
"></i> Wallet</a> </li>
                        <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-money"></i> Add Money</a> </li> <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-fw fa-mobile"></i> Mobile Recharge</a> </li> <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-fw fa-qrcode"></i> QR Code</a> </li>
                        <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-fw fa-qrcode"></i> Dynamic QRCode</a> </li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                       <li class="hidden-xs"> <a class="active" href="#"><i class="fa fa-sign-out"></i> LogOut</a> </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="user-dashboard">
            <h1>Hello, JS</h1>
            <div class="row">

                <div  class="col-md-12 col-sm-12 col-xs-12 gutter">

                    <div style="height: 120px; " class="sales report col-md-12">
                        <div  style="margin-top: 2%" class="row">
                            <div class="col-md-4">
                                <h2 >Welcome ,Neaz Ahsan </h2>
                                <h5  class="headcolor">Account Type: <span><b>personal</b></span>  </h5>
                            </div>

                            <div class="col-md-2">

                                <h6 style="color: #8492af;">Last transction    <span  style="color: #223a6f"><b>$200000</b></span>  </h6>
                            </div>
                            <div class="col-md-2">
                                <h6 style="color: #8492af;">Last transction    <span  style="color: #223a6f"><b>$200000</b></span>  </h6>
                            </div>
                            <div class="col-md-1">
                            </div>
                            <div class="sales report col-md-2 " style="background-color: #132261;">
                                <h2 >  Balance <br> <b style="color: white">$20000</b> </h2 >
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="" style=" margin-top: 2%">
                <div class="">
                    <div class="">
                        <div class="table100 ver1 m-b-110">
                            <div class="table100-head">
                                <table>
                                    <thead>
                                    <tr class="row100 head">
                                        <th class="cell100 column1">Class name</th>
                                        <th class="cell100 column2">Type</th>
                                        <th class="cell100 column3">Hours</th>
                                        <th class="cell100 column4">Trainer</th>
                                        <th class="cell100 column5">Spots</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="table100-body js-pscroll">
                                <table>
                                    <tbody>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Like a butterfly</td>
                                        <td class="cell100 column2">Boxing</td>
                                        <td class="cell100 column3">9:00 AM - 11:00 AM</td>
                                        <td class="cell100 column4">Aaron Chapman</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Mind & Body</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Adam Stewart</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Crit Cardio</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">9:00 AM - 10:00 AM</td>
                                        <td class="cell100 column4">Aaron Chapman</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Wheel Pose Full Posture</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">7:00 AM - 8:30 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Playful Dancer's Flow</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Zumba Dance</td>
                                        <td class="cell100 column2">Dance</td>
                                        <td class="cell100 column3">5:00 PM - 7:00 PM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Cardio Blast</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">5:00 PM - 7:00 PM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Pilates Reformer</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Supple Spine and Shoulders</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">6:30 AM - 8:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Yoga for Divas</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">9:00 AM - 11:00 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Virtual Cycle</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Like a butterfly</td>
                                        <td class="cell100 column2">Boxing</td>
                                        <td class="cell100 column3">9:00 AM - 11:00 AM</td>
                                        <td class="cell100 column4">Aaron Chapman</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Mind & Body</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Adam Stewart</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>
                                    <tr class="row100 body">
                                        <td class="cell100 column1">Crit Cardio</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">9:00 AM - 10:00 AM</td>
                                        <td class="cell100 column4">Aaron Chapman</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Wheel Pose Full Posture</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">7:00 AM - 8:30 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Playful Dancer's Flow</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Zumba Dance</td>
                                        <td class="cell100 column2">Dance</td>
                                        <td class="cell100 column3">5:00 PM - 7:00 PM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Cardio Blast</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">5:00 PM - 7:00 PM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Pilates Reformer</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">10</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Supple Spine and Shoulders</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">6:30 AM - 8:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">15</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Yoga for Divas</td>
                                        <td class="cell100 column2">Yoga</td>
                                        <td class="cell100 column3">9:00 AM - 11:00 AM</td>
                                        <td class="cell100 column4">Donna Wilson</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>

                                    <tr class="row100 body">
                                        <td class="cell100 column1">Virtual Cycle</td>
                                        <td class="cell100 column2">Gym</td>
                                        <td class="cell100 column3">8:00 AM - 9:00 AM</td>
                                        <td class="cell100 column4">Randy Porter</td>
                                        <td class="cell100 column5">20</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>





<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>
