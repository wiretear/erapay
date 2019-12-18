
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
    <title>TALKTIME RECHARGE</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Our Custom CSS -->

    <head>
        <link href="${bootstrapmincss}" rel="stylesheet" type="text/css" media="all"/>
        <link href="${css}" rel="stylesheet" type="text/css" media="all"/>
        <link href="${navcss}" rel="stylesheet" type="text/css" media="all"/>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {

                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                // when opening the sidebar
                $('#sidebarCollapse').on('click', function () {
                    // open sidebar
                    $('#sidebar').addClass('active');
                    // fade in the overlay
                    $('.overlay').fadeIn();
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });


                // if dismiss or overlay was clicked
                $('#dismiss, .overlay').on('click', function () {
                    // hide the sidebar
                    $('#sidebar').removeClass('active');
                    // fade out the overlay
                    $('.overlay').fadeOut();
                });
            });
            function callpage ()
            {
                if(document.getElementById("login-submit")){
                    $('#myModal').modal('show');
                }
            }

        </script>
        <script>
            $(document).ready(function (){
                validate();
                $('#amount, #mobileno').change(validate);
            });

            function validate(){
                if ($('#amount').val().length   >   0   &&
                    $('#mobileno').val().length  >   0   &&
                    $('#radio').val().length    >   0) {
                    $("input[type=submit]").prop("disabled", false);
                }
                else {
                    $("input[type=submit]").prop("disabled", true);
                }
            }
        </script>
        <script>
function callpage ()
{
	if(document.getElementById("login-submit")){
	$('#myModal').modal('show');
	}
}
function doSelect(a,b) {
	opener.document.oLoadFundForm.bankAccount.value = a;
	opener.document.oLoadFundForm.bankName.value = b;
	//opener.document.frm.menuDescription.value = b;
	/*  oMenuGenarationForm.groupId.value=a;
	  alert(oMenuGenarationForm.groupId.value);
	  window.oMenuGenarationForm.groupId.value;*/
	window.close();
}
</script>

    </head>
    <body onload="callpage()">

            <!-- Sidebar Holder -->
            <jsp:include page="../fragments/nav.jsp" />
            <div class="wrapper">
                <!-- Sidebar Holder -->
                <jsp:include page="../fragments/SideNav.jsp" />

                         <div style="margin-top:60px;" class="row col-md-7 col-md-offset-1">

 <div class="panel">
      <div class="panel-heading text-center custom-header-panel1">Talk Time Recharge</div>
      <div class="panel-body">
         <form:form method="post" modelAttribute="oTalkTimeForm1"
		name="oTalkTimeForm1" action="/erapay/executeotp">
<div class="col-md-12">

  <div class="form-group col-md-2">

                        </div>
                          <div class="form-group col-md-9">
                            <label for="first_name">Mobile No</label>
                              <form:input type="number" path="mobileNo" class="form-control" value="${oTalkTimeForm.mobileNo}" placeholder="Mobile No"/>
                        </div>


                            </div>
                            <div class="col-md-12">
                           <div class="form-group col-md-2">

                        </div>
                            <div class="col-md-9">
                                                    <label class="radio-inline">
    <form:radiobutton  path ="billType" value="Prepaid" label= "Prepaid" />
    </label>
    <label class="radio-inline">
   <form:radiobutton path = "billType" value="Postpaid" label= "Postpaid" />
    </label>

                            </div>
                            </div>
                            <div style="margin-top:5px;"class="col-md-12">
                              <div class="form-group col-md-2">

                        </div>
                          <div class="form-group col-md-9">
                            <label for="first_name">Amount</label>
                             <form:input type="number" path="amount" class="form-control" value="${oTalkTimeForm.amount}" placeholder="Amount"/>
                        </div>
                            </div>
                                 <div class="col-md-12">
                                     <div class="form-group col-md-2">

                        </div>
                          <div class="form-group col-md-9">
                                      <div class="form-check">
    <label class="form-check-label" for="check1">
        <input type="checkbox" class="form-check-input" id="check1" name="vehicle1" value="something" checked>Payment By Wallet
      </label>
</div>
                        </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-4">

                                </div>
                                <div class="col-sm-3">
                                    <input type="submit" name="login-submit" id="login-submit"
                                           tabindex="4" class="form-control btn btn-primary"
                                           value="Submit">
                                </div>
                                <div class="col-sm-3">
                    <input type="submit" name="login-submit"
                                           tabindex="4" class="form-control btn btn-primary"
                                           value="Cancel">
                                               </div>
                            </div>
                             </form:form>
          <div id="myModal" data-keyboard="false" data-backdrop="static" class="modal fade" role="dialog">
              <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                      <div class="modal-header custom-header-panel1">

        <h4 class="modal-title text-center">Confirm Mobile Recharge</h4>
      </div>
      <div class="modal-body">
       <form:form method="post" modelAttribute="oTalkTimeForm"
		name="oTalkTimeForm" action="/erapay/executetalktime">
   <div style="margin-top:20px;" class="col-md-12">
     
   <div class="panel-body">

  
                         <div  style="margin-top:42px;" class="col-md-12">
                          <div class="col-md-4 form-group">
                                <label class="pull-left">Type:</label>
                            </div>
                           
                            <div class="col-md-4 form-group">
                                <p><strong><%=session.getAttribute( "BILL" )%></strong></p>
                            </div>
                        </div>   
                                  
                        <div class="col-md-12">
                          <div class="col-md-4 form-group">
                                <label class=pull-left>Amount:</label>
                            </div>
                           
                            <div class="col-md-4 form-group">
                                <p><strong><%=session.getAttribute( "GSAMOUNT" )%></strong></p>
                            </div>
                        </div>   
                        
                     <div class="col-md-12">                  
  <div class="form-group col-md-4">
     <label class="pull-left">OTP:</label>
                        </div>
                          <div  class="form-group col-md-8">
                         
                             <input type="password" class="form-control"  placeholder="Enter OTP Here"/>
                        </div>
                                      
                            </div>
                               </div>
      </div>
      <div class="modal-footer">
       <div class="row">
                              <div class="col-sm-4">
                                 
                                </div>
                                <div class="col-sm-3">
                                    <input type="submit" name="login-submit" id="login-submit" 
                                           tabindex="4" class="form-control btn btn-primary"
                                           value="Submit">
                                </div>
                                   <div class="col-sm-3">
                                    <input type=" " name="login-submit" data-dismiss="modal" id="login-submit" 
                                           tabindex="4" class="form-control btn btn-primary"
                                           value="Close">
                                </div>
                            </div>
                            </div>
                            </form:form>  
        
      </div>
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

