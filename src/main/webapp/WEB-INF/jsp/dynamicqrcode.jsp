<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 31-Jan-19
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <spring:url value="/img" var="images" />
    <spring:url value="/images" var="dbimages" />
    <spring:url value="/core/css/bootstrap.min.css" var="bootstrapmincss" />
    <spring:url value="/core/css/wallettowallet.css" var="css" />
    <spring:url value="/core/css/nav.css" var="navcss" />
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <spring:url value="/img" var="images" />
        <%String sCusCode = (String) session.getAttribute("CUSCODE");%>
    <title>Dynamic Qrcode</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Our Custom CSS -->

    <head>
        <link href="${bootstrapmincss}" rel="stylesheet" type="text/css" media="all"/>
        <link href="${css}" rel="stylesheet" type="text/css" media="all"/>
        <link href="${navcss}" rel="stylesheet" type="text/css" media="all"/>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            $(document).ready(function() {

                $("#sidebar").mCustomScrollbar({
                    theme : "minimal"
                });

                // when opening the sidebar
                $('#sidebarCollapse').on('click', function() {
                    // open sidebar
                    $('#sidebar').addClass('active');
                    // fade in the overlay
                    $('.overlay').fadeIn();
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
                // if dismiss or overlay was clicked
                $('#dismiss, .overlay').on('click', function() {
                    // hide the sidebar
                    $('#sidebar').removeClass('active');
                    // fade out the overlay
                    $('.overlay').fadeOut();
                });
            });
        </script>
    </head>
<body>
<jsp:include page="../fragments/nav.jsp" />


<div class="wrapper">
    <!-- Sidebar Holder -->
    <jsp:include page="../fragments/SideNav.jsp" />

    <!-- Page Content Holder -->

    <div class="container-fluid ">

        <div style="margin-top: 70px;" class="col-md-12">
            <div style="color: red;" class="col-md-4 text center"></div>

            <div style="color: red;" class="col-md-6 text center">
            </div>
        </div>
        <div class="col-md-8 col-md-offset-1">
            <div class="panel">
                <div class="panel-heading text-center custom-header-panel">Dynamic QrCode</div>
                <div class="panel-body">
                    <form:form method="post" data-toggle="validator" role="form"
                               modelAttribute="oQrcodeForm" name="oQrcodeForm"
                               action="/erapay/executedynamicqrcode">
                        <div class="col-md-12">

                            <br>

                        </div>
                        <div class="col-md-12">
                            <div class="col-md-3"></div>
                            <div class="form-group col-md-6">
                                    <%--@declare id="narration"--%><label class="text-center" for="narration">WalletID</label>
                                <form:input type="text" path="walletId"
                                            class="form-control"
                                            value="${QrcodeForm.walletId}"
                                            placeholder="WalletID" required="required"/>
                            </div>
                        </div>

                            <div class="col-md-12">
                                <div class="col-md-3"></div>
                                <div class="form-group col-md-6">
                                        <%--@declare id="narration"--%><label class="text-center" for="narration">Name</label>
                                    <form:input type="text" path="name"
                                                class="form-control"
                                                value="${QrcodeForm.name}"
                                                placeholder="Name" required="required"/>
                                </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-3"></div>
                            <div class="form-group col-md-6">
                                <%--@declare id="narration"--%><label class="text-center" for="narration">Narration</label>
                                <form:input type="text" path="narration"
                                            class="form-control"
                                            value="${QrcodeForm.narration}"
                                            placeholder="Narration" required="required"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-3"></div>
                            <div class="form-group col-md-6">
                                <label class="text-center" >Amount</label> <form:input
                                    type="text"  path="amount" data-minlength="4" class="form-control"
                                    id="inputPassword" value="${QrcodeForm.amount}" placeholder="Amount"  required="required"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-4">
                                <input type="submit" name="qr-submit" id="qr-submit"
                                       tabindex="4" class="form-control btn btn-primary"
                                       value="QrCode">
                            </div>

                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#sidebarCollapse').on('click', function() {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>

