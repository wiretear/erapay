<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
   <spring:url value="/images" var="dbimages"/>
<spring:url value="/image" var="image"/>
   <spring:url value="/Test" var="dbimagestest"/>
   <spring:url value="/qrcode" var="qrcode"/>
   <spring:url value="/epay/nav.css" var="navcss" />
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%String photoemailid = (String) session.getAttribute("photoemailid");%>


    <head>
        <link href="${navcss}" rel="stylesheet" type="text/css" media="all"/>
<style>
    .ui-navbar .ui-btn-text {
        font-size: 10px;
    }
</style>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
  <nav id="sidebar">
 <div class="sidebar-header">
                 <img  id="image" style="margin-left:42px;"  src="${image}/<%=photoemailid%>.jpg" class="img-circle" alt="Random Name" width="130" height="130">
                  <h4 style="color:white;" class="text-center"><%out.print(session.getAttribute("GSUSERNAME"));%></h4>
                    <h6 style="color:white;" class="text-center">Wallet ID: <%out.print(session.getAttribute("LoginWalletId"));%></h6>
                   </div>
      <c:forEach var="boo" items="${sessionScope['KycFormmMenuList'].listOfMenuList}">
               <ul class="list-unstyled ">

                   <li>
                       <a  href="${boo.menuLink}"><c:out value="${boo.menuName}"/></a>
                   </li>
                </ul>
      </c:forEach>
            </nav>