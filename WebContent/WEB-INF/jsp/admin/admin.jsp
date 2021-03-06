<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="fi.pizzablue.bean.Pizza"%>
<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
	<title>Pizzojen ja juomien hallinta</title>
	<link rel="stylesheet" type="text/css" href="css/adminstyles.css"/>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<!-- Bootstrap Core CSS -->
 	<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/grayscale.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Hallintapaneeli</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">Tuotteet</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="http://proto297.haaga-helia.fi:8080/pizzablue/tiedotteet">Tiedotteet</a>
                    </li>
                    <!--<li>
                        <a class="page-scroll" href="">Aukioloajat</a>
                    </li>-->
                    <li>
                        <a class="page-scroll" href="kirjaudu_ulos">Kirjaudu ulos</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<section id="hallinta" class="container content-section text-center">
<h1>Hallinnoi pizzoja ja juomia</h1>
<!-- pizzat -->
<c:if test="${not empty param.added}"><br><p class="pizzanluomisilmoitus">Uuden pizzan luominen onnistui!</p></c:if>
<c:if test="${not empty param.deleted}"><br><p class="pizzanpoistoilmoitus">Pizzan poistaminen onnistui!</p></c:if>
<!-- juomat -->
<c:if test="${not empty param.lisatty}"><br><p class="pizzanluomisilmoitus">Uuden juoman luominen onnistui!</p></c:if>
<c:if test="${not empty param.poistettu}"><br><p class="pizzanpoistoilmoitus">Juoman poistaminen onnistui!</p></c:if>
<br>
<h2>Pizzat</h2><br>
</section>
<section>
<table class="sisaltopizza text-uppercase table-responsive taulukot">
    <tr>
    <td class="ylinrivi id"><strong>id</strong></td>
    <td class="ylinrivi"><strong>nimi</strong></td>
    <td class="ylinrivi"><strong>hinta</strong></td>
    <td class="ylinrivi"><strong>energia</strong></td>
    <td class="ylinrivi"><strong>proteiini</strong></td>
    <td class="ylinrivi"><strong>hiilihydraatti</strong></td>
    <td class="ylinrivi"><strong>rasva</strong></td>
    <td class="ylinrivi"><strong>täytteet</strong></td>
    <td class="ylinrivi"><strong>poista</strong></td>
    </tr>
    
    <c:forEach items="${pizzat}" var="pizza">
    <tr class="tuoterivi">
    <!-- nämä pitää olla c:outin sisällä, muuten käyttäjä pääsee syöttämään scriptejä syötekenttiin -->
    <td><c:out value="${pizza.id}"/></td>
    <td><c:out value="${pizza.nimi}"/></td>
    <td><fmt:formatNumber value="${pizza.hinta}"  minFractionDigits="2"/> &euro;</td>
    <td class="ravintoarvot"><c:out value="${pizza.energia}"/></td>
    <td class="ravintoarvot"><fmt:formatNumber value="${pizza.proteiini}"  minFractionDigits="2"/></td>
    <td class="ravintoarvot"><fmt:formatNumber value="${pizza.hiilihydraatti}"  minFractionDigits="2"/></td>
    <td class="ravintoarvot"><fmt:formatNumber value="${pizza.rasva}"  minFractionDigits="2"/></td>
    <td class="ravintoarvot"><c:forEach items="${pizza.taytteet}" var="tayte"><c:out value="${tayte.nimi}"/> </c:forEach></td>
    <td>
    <form action="del" method="post"><input type="hidden" name="id" value="<c:out value="${pizza.id}"/>"><button class="btn btn-danger nappula"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></form></td>
    </tr>
    </c:forEach>
    	 <tr>
    	  <td></td>
    	  	<td><label for="nimi"><input type="text" name="nimi" form="addform"></label></td>
    	  	<td><label for="hinta"><input type="number" min="0" step="any" name="hinta" form="addform"></label></td>
    	  	<td><label for="energia"><input type="number" min="0" step="any" name="energia" form="addform"></label></td>
    	  	<td><label for="proteiini"><input type="number" min="0" step="any" name="proteiini" form="addform"></label></td>
    	  	<td><label for="hiilihydraatti"><input type="number" min="0" step="any" name="hiilihydraatti" form="addform"></label></td>
    	  	<td><label for="rasva"><input type="number" min="0" step="any" name="rasva" form="addform"></label></td>
    	  	<td><label for="taytteet"><input type="text" placeholder="pilkulla eroteltuna" min="0" step="any" name="taytteet" form="addform"></label></td>
    	  	<td><form action="add" method="post" id="addform"><button class="btn btn-success nappula" type="submit"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button></form></td>	
    	 </tr>
   </table>
   	<section class="container content-section text-center">
    <br><br>
    <h2>Juomat</h2><br>
 	</section>
    <table class="sisaltojuoma text-uppercase table-responsive taulukot">
    <tr>
    <td class="ylinrivi id"><strong>id</strong></td>
    <td class="ylinrivi"><strong>nimi</strong></td>
    <td class="ylinrivi"><strong>maara</strong></td>
    <td class="ylinrivi"><strong>hinta</strong></td>
    <td class="ylinrivi"><strong>energia</strong></td>
    <td class="ylinrivi"><strong>proteiini</strong></td>
    <td class="ylinrivi"><strong>hiilihydraatti</strong></td>
    <td class="ylinrivi"><strong>rasva</strong></td>
    <td class="ylinrivi"><strong>poista</strong></td>
    </tr>
    
    <c:forEach items="${juomat}" var="juoma">
    <tr class="tuoterivi">
    <!-- nämä pitää olla c:outin sisällä, muuten käyttäjä pääsee syöttämään scriptejä syötekenttiin -->
    <td><c:out value="${juoma.id}"/></td>
    <td><c:out value="${juoma.nimi}"/></td>
     <td><c:out value="${juoma.maara}"/></td>
    <td><fmt:formatNumber value="${juoma.hinta}"  minFractionDigits="2"/> &euro;</td>
    <td><c:out value="${juoma.energia}"/></td>
    <td><fmt:formatNumber value="${juoma.proteiini}"  minFractionDigits="2"/></td>
    <td><fmt:formatNumber value="${juoma.hiilihydraatti}"  minFractionDigits="2"/></td>
    <td><fmt:formatNumber value="${juoma.rasva}"  minFractionDigits="2"/></td>
    <td>
    <form action="poistajuoma" method="post"><input type="hidden" name="id" value="<c:out value="${juoma.id}"/>"><button class="btn btn-danger nappula"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></form></td>
    </tr>
    </c:forEach>
    	 <tr>
    	  <td></td>
    	  	<td><label for="jnimi"><input type="text" name="jnimi" form="lisaajuoma"></label></td>
    	  	<td><label for="jmaara"><input type="number" min="0" step="any" name="jmaara" form="lisaajuoma"></label></td>
    	  	<td><label for="jhinta"><input type="number" min="0" step="any" name="jhinta" form="lisaajuoma"></label></td>
    	  	<td><label for="jenergia"><input type="number" min="0" step="any" name="jenergia" form="lisaajuoma"></label></td>
    	  	<td><label for="jproteiini"><input type="number" min="0" step="any" name="jproteiini" form="lisaajuoma"></label></td>
    	  	<td><label for="jhiilihydraatti"><input type="number" min="0" step="any" name="jhiilihydraatti" form="lisaajuoma"></label></td>
    	  	<td><label for="jrasva"><input type="number" min="0" step="any" name="jrasva" form="lisaajuoma"></label></td>
    	  	<td><form action="lisaajuoma" method="post" id="lisaajuoma"><button class="btn btn-success nappula" type="submit"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button></form></td>	
    	 </tr>
   </table>
 </section>
</body>
<footer><br><br>
</footer>

<!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>
    
</html>