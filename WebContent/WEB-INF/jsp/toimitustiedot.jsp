<%@ page import="fi.pizzablue.bean.Pizza"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/grayscale.css" rel="stylesheet">

<!-- Team Blue CSS -->
<link href="css/teamblue_styles.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<title>Tilaustiedot</title>
</head>
<body>
	<!-- Toimitustiedot -->
	<section id="toimitustiedot"
		class="container content-section text-center" style="padding: 50px 0px 0px 0px !important;">
		<div class="col-lg-12">
				<%-- <h1>Valitse toimitustapa</h1>
				<p>Valitse
					alhaalta haluamasi toimitustapa tilauksellesi. Jos haluat saada
					tilausvahvistuksen, muista mainita sähköpostiosoitteesi
					toimitustietoja täyttäessäsi</p>
				<ul id="tabs" class="nav nav-tabs viiva-pois">
					<li class="active"><a href="#kotiinkuljetus"
						class="btn btn-default btn-lg butska" data-toggle="tab">Kotiinkuljetus</a>
					</li>
					 <li><a href="#nouto" class="btn btn-default btn-lg butska"
						data-toggle="tab">Nouto</a></li> 
				</ul>
				<br> <br>

				<!-- kotiinkuljetus -->
				
				<div id="my-tab-content" class="tab-content">
				<form action="siirry_toimitustietoihin" method="post" role="form">
					<div id="kotiinkuljetus" class="tab-pane fade in active">
					--%>
					<form action="siirry_tilausvahvistukseen" method="post" role="form">
						<div class="col-lg-4 col-lg-offset-4">
								<div class="form-group col-xs-6">
									<label for="Etunimi">Etunimi: </label><input
										class="form-control" type="text" name="etunimi"
										style="color: black">
								</div>
								<div class="form-group col-xs-6">
									<label for="Sukunimi">Sukunimi: </label><input
										class="form-control" type="text" name="sukunimi"
										style="color: black">
								</div>
								<div class="form-group col-xs-12">
									<label for="Katuosoite">Katuosoite: * </label><input
										class="form-control" type="text" name="katuosoite"
										style="color: black">
								</div>
								<div class="form-group col-xs-6">
									<label for="Postinumero">Postinumero: * </label><input
										class="form-control" type="text" pattern="[0-9]{5}"name="postinumero"
										style="color: black" required oninvalid="setCustomValidity('Syötä vain numeroita! ')"
    onchange="try{setCustomValidity('')}catch(e){}"> 
								</div>
								<div class="form-group col-xs-6">
									<label for="Paikkakunta">Paikkakunta: * </label><input
										class="form-control" type="text" name="paikkakunta"
										style="color: black">
								</div>
								<div class="form-group col-xs-12">
									<label for="Puhelinnumero">Puhelinnumero: *</label><input
										class="form-control" type="tel" name="puhelinnumero" pattern="[0-9]{10}" name="puhelinumero" style="color:black" oninvalid="setCustomValidity('Syötä vain numeroita! ')"
    onchange="try{setCustomValidity('')}catch(e){}"></div>
										
								<div class="form-group col-xs-12">
									<label for="Sahkoposti">Sähköposti: </label><input
										class="form-control" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" name="sahkoposti" style="color:black" oninvalid="setCustomValidity('Syötä sähköposti oikeassa muodossa (nimi@maili.com) ')"
    onchange="try{setCustomValidity('')}catch(e){}">
								</div>
								<div class="form-group col-xs-12">
									<label for="Lisatietoja">Lisätietoja: </label>
									<textarea class="form-control" name="lisatietoja" rows="8"
										max-cols="40" placeholder="Esim. ovikoodi" style="color: black"></textarea>
								</div>
								<a href="http://localhost:8080/pizzablue/ostoskorinsisalto" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>  Edellinen sivu</a>
			<button class="btn btn-default btn-lg" type="submit" value="Submit">Seuraava sivu  <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></button>
						</div>
						</form>
					</div>
					
					
					<!-- nouto -->
					<%-- 
					<form action="siirry_toimitustietoihin" method="post" role="form">
					<div id="nouto" class="tab-pane fade">
						<div class="col-lg-4 col-lg-offset-4">
							
								<div class="form-group col-xs-12">
									<label for="Puhelinnumero">Puhelinnumero: *</label><input
										class="form-control" type="tel" name="puhelinnumero"
										style="color: black">
								</div>
								<div class="form-group col-xs-12">
									<label for="Sahkoposti">Sähköposti: </label><input
										class="form-control" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" name="sahkoposti" style="color:black" oninvalid="setCustomValidity('Syötä sähköposti oikeassa muodossa (nimi@maili.com) ')"
    onchange="try{setCustomValidity('')}catch(e){}">
								</div>
								<a href="http://localhost:8080/pizzablue/ostoskorinsisalto" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>  Edellinen sivu</a>
			<button class="btn btn-default btn-lg" type="submit" value="Submit">Seuraava sivu  <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></button>
							
						</div>
					</div>
					
					</form> --%>
				
			
	</section>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="js/jquery.easing.min.js"></script>

	<!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/grayscale.js"></script>

	<script>
		$(document).ready(function() {

			$("#tabs").tabs();

		});
	</script>


</body>

</html>