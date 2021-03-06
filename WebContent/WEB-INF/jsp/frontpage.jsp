<%@ page import="fi.pizzablue.bean.Pizza"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Pizza Blue:n arvoihin kuuluu kotimaisten, lähellä tuotettujen raaka-aineiden käyttö, sekä pyrkimys mahdollisimman pieneen hiilijalanjälkeen.">
<meta name="robots" content="index, follow">
<meta name="keywords" content="pizza, pizzeria, kotimainen, tilaus, kuljetus, ruoka, pitsalista, täytteet, gluteeniton, ruokavalio, arvot, helsinki, palaute, esittely, yhteystiedot, pasila">
<title>Pizza Blue | Pizzaa kotimaisilla raaka-aineilla</title>
<meta name="google-site-verification" content="" />

<!-- favicon kuva -->
<link rel="shortcut icon" type="image/png" href="img/favicon.png" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/grayscale.css" rel="stylesheet">

<!-- Team Blue CSS -->
<link href="css/teamblue_styles.css" rel="stylesheet">

<!-- Bootstrap navbar cart -->
<link href="css/bootstrap_navbar_cart.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<!-- tähtiarvioinnin tyylitiedosto -->
<link href="css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigointi -->
	<nav class="navbar navbar-custom navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
					<i class="fa fa-bars"></i>
				</button>

				<a class="navbar-brand page-scroll" href="#page-top"> 
				<i class="fa"><img src="img/pieni_logo.png" alt="logo" style="height: 30px"></i>
				<span class="light"> Pizza</span> Blue
				</a>
			</div>

			<!-- navigointipalkin sisältö -->
			<div class="collapse navbar-collapse navbar-right navbar-main-collapse">
				
				<ul class="nav navbar-nav">
					<!-- navigointipalkin napit ohjaavat käyttäjän tiettyihin kohtiin etusivulla -->
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="#esittely">Esittely</a></li>
					<li><a class="page-scroll" href="#pitsalista">Valikoima</a></li>
					<li><a class="page-scroll" href="#yhteystiedot">Yhteystiedot</a></li>
					
					<!-- mini-ostoskori alkaa -->
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><c:out value="${tilaus.getTilausrivit().size()}"/> <span class="glyphicon glyphicon-shopping-cart"></span><span class="caret"></span></a>
						<ul class="dropdown-menu dropdown-cart" role="menu">
							<c:forEach items="${tilaus.tilausrivit}" var="tilausrivi" varStatus="count">
								<!-- tarkistetaan onko tilausrivi pizzarivi -->
								<c:if test="${tilausrivi.getClass().name == 'fi.pizzablue.bean.Pizzarivi'}">
									<li>
										<form action="poista_tuote_ostoskorista" method="post">
											<span class="item"> 
												<span class="item-left"> 
													<!-- haetaan kuva jolla on pizzarivillä olevan pizzan numero -->
													<img src="img/m<c:out value="${tilausrivi.pizza.numero}"/>.png" alt="kuva"> 
													<span class="item-info"> 
														<!-- haetaan pizzarivillä olevan pizzan numero -->
														<c:out value="${tilausrivi.pizza.numero}" />. 
														<!-- haetaan pizzarivillä olevan pizzan nimi -->
														<c:out value="${tilausrivi.pizza.nimi}" /><br/> 
														<!-- haetaan pizzarivillä olevan pizzan hinta -->
														<fmt:formatNumber value="${tilausrivi.pizza.hinta}" minFractionDigits="2"></fmt:formatNumber> €
													</span>
												</span> 
												<span class="item-right"> <input type="hidden" name="ordernr" value="<c:out value="${count.index}"/>">
													<!-- poista nappi -->
														<button type="submit" class="btn btn-xs btn-danger pull-right">x</button>

												</span>
											</span>
										</form>
									</li>
								</c:if>
							</c:forEach>
							<c:forEach items="${tilaus.tilausrivit}" var="tilausrivi" varStatus="count">
								<!-- tarkistetaan onko tilausrivi juomarivi -->
								<c:if test="${tilausrivi.getClass().name == 'fi.pizzablue.bean.Juomarivi'}">
									<li>
										<form action="poista_tuote_ostoskorista" method="post">
											<span class="item"> 
												<!-- haetaan kuva jolla on juomarivillä olevan juoman numero -->
												<span class="item-left"><img src="img/mj<c:out value="${tilausrivi.juoma.numero}"/>.png" alt="kuva">
													<span class="item-info"> 
														<!--  haetaan juomarivillä olevan juoman numero -->
														<c:out value="${tilausrivi.juoma.numero}" />. 
														<!-- haetaan juomarivillä olevan juoman nimi -->
														<c:out value="${tilausrivi.juoma.nimi}" /><br />
														<!-- haetaan juomarivillä olevan juoman hinta --> 
														<fmt:formatNumber value="${tilausrivi.juoma.hinta}" minFractionDigits="2"></fmt:formatNumber> €
													</span>
												</span> 
												<span class="item-right"> <input type="hidden" name="ordernr" value="<c:out value="${count.index}"/>">
													<!-- valitun tuotteen poistaminen ostokorista napin kautta -->
													<button type="submit" class="btn btn-xs btn-danger pull-right">x</button>
												</span>
											</span>
										</form>
									</li>
								</c:if>
							</c:forEach>
							
							<!-- testataan onko ostoskorissa tuotteita, jotta tilaamaan ei pääse ostoskorin ollessa tyhjä -->
							<c:if test="${tilaus.getTilausrivit().size() != null && tilaus.getTilausrivit().size() != 0}">
							<li class="divider"></li>
							<li><a class="text-center" href="http://proto297.haaga-helia.fi:8080/pizzablue/ostoskorinsisalto">Siirry tilaamaan</a></li>
							</c:if>
							<c:if test="${tilaus.getTilausrivit().size() ==  null || tilaus.getTilausrivit().size() == 0}"><br/>
							<li class="text-center" style="color:black;">Ostoskori on tyhjä !</li>
							<li class="divider"></li>
							<br>
							</c:if>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- intron header -->
	<header class="intro">
		<div class="intro-body">
			<div class="container">
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-10">
						<img src="img/iso_logo.png" class="img-responsive center-block col-xs-12 etusivu-iso-logo" alt="Responsive image">
					</div>
				</div>
				<div class="col-lg-1"></div>
				<!--  virheilmoitus mikäli ostoskoriin yritetään syöttää muuta kuin pizzaid -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger row">
						<strong>Virhe!</strong>
						<c:out value="${error}" />
					</div>
				</c:if>
				<!-- tilausvahvistus sivulta palataan etusivulle, tähän pitäisi tulla tilausvahvistuspopup -->
				<c:if test="${not empty vahvistus}">
					<div class="alert alert-success row">
						<strong>Tilaus vahvistettu!</strong>
						<c:out value="${vaihvistus}" />
					</div>
				</c:if>
				<div class="row">
					<a href="#esittely" class="btn btn-circle page-scroll center-block">
						<i class="fa fa-angle-double-down animated"></i>
					</a>
				</div>
			</div>
		</div>
	</header>
	<!-- esittely sivu alkaa -->
	<section id="esittely" class="container content-section text-center">
		<div class="row">
			<div class="col-lg-6">
				<h2>Esittely</h2>
				<p>
					Vuonna 2012, kolme Pasilasta kotoisin olevaa ruokaa ja
					yhteisöllisyyttä arvostavaa ystävää päättivät lyödä intohimoiset
					päänsä yhteen ja perustaa Pizza Blue:n.<br/> <br/> Pizza
					Blue:n arvoihin kuuluu kotimaisten, lähellä tuotettujen
					raaka-aineiden käyttö, sekä pyrkimys mahdollisimman pieneen
					hiilijalanjälkeen. Haluamme tarjota asiakkaillemme myös
					mahdollisuuden tukea kotimaista työvoimaa hyödyntämällä myös muiden
					kotimaisten yrittäjien tarjoamia palveluita tuottaessamme aidosti
					kotimaisen makuelämyksen. <br/> <br/> Pizzeriassamme on
					laaja valikoima pizzoja, josta erilaisia ruokavaliota
					noudattavatkin voivat löytää jotain nautittavaa. <br/> <br/>
					Pizzapohjamme on saanut myös tunnustusta useamman kerran
					kansainvälisessä <i>The Best Pizza In The Whole Wide World
						(TBPITWWW)</i> kilpailun parhaan pizzapohjan kategoriassa
					sijoittumalla kolmen parhaan joukkoon vuosina 2012-2014.
				</p>
			<!-- slaissi-kuva on liian alhaalla sillä esittelyosasta tulee liian pitkä! -->
			</div>
			<div class="col-lg-6">
				<h2>Tiedotteet</h2>
				<c:forEach items="${tiedotteet}" var="tiedote" varStatus="count" end="2">
				<blockquote><h4 style="color:#42DCA3;"><c:out value="${tiedote.otsikko}"/></h4><c:out value="${tiedote.sisalto}"/></blockquote>
				</c:forEach>
				<img class="img-responsive center-block" src="img/Bonappetito.png" alt="kuva">
			</div>
		</div>
		<!-- esittely sivu päättyy -->
	</section>
	<!-- Tuotelista -->
	<section id="pitsalista" class="content-section text-center">
		<div class="download-section">
			<div class="container">
				<div class="col-lg-12">
					<h2>Valikoima</h2>
					<p>Tilauksen yhteydessä voit valita haluatko pitsallesi gluteenittoman, tavallisen vai täysjyvä pohjan.
						<br/>Kaikkiin pitsoihin kuuluu vakiona juusto sekä tomaattikastike.
						<br/>Huomioithan, että voit tilata korkeintaan kymmenen pitsaa.
						<br/><br/>Toimitamme tilaukset maksimissaan viiden kilometrin säteelle pitseriastamme. <br/>Kotiinkuljetuksemme hinta on <span style="color: pink; font-weight: 700;">2.99 €</span>
						<br/> <br/>
					</p>
					<!-- navigointi pizzojen ja juomien välillä -->
					<ul id="tabs" class="nav nav-tabs viiva-pois">
						<li class="active"><a href="#pizzalista" class="btn btn-default btn-lg butska" data-toggle="tab">pizzat</a></li>
						<li><a href="#juomalista" class="btn btn-default btn-lg butska" data-toggle="tab">juomat</a></li>
					</ul>
					<small>	<!-- lisätty ohje nappien käytöstä -->
						<br><span style="color:#42DCA3; font-size:35px;">*</span> Yläpuolella näkyvien nappien avulla, pääset hyppimään pitsojen ja juomien välillä.
					</small>
					<br> <br>
					<!-- PIZZALISTA ALKAA -->
					<div id="my-tab-content" class="tab-content">
						<div id="pizzalista" class="tab-pane fade in active">
							<div class="row">
								<c:forEach items="${pizzat}" begin="0" end="3" var="pizza">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${pizza.numero == 1}">
													<img src="img/1.png" alt="hawaji">
												</c:when>
												<c:when test="${pizza.numero == 2}">
													<img src="img/2.png" alt="italiano">
												</c:when>
												<c:when test="${pizza.numero == 3}">
													<img src="img/3.png" alt="mexico">
												</c:when>
												<c:otherwise>
													<img src="img/4.png" alt="pizzabluespecial">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${pizza.numero}" />
													.
													<c:out value="${pizza.nimi}" />
												</h3>
												<p>
													Täytteet: <br>
													<c:forEach items="${pizza.taytteet}" var="tayte">
														<c:out value="${tayte.nimi}" />
													</c:forEach>
												</p>
												<!-- Ravintoarvot -->
												<button class="ravintoarvotBut btn btn-primary">
												<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${pizza.energia}" />
														kcal proteiini:
														<c:out value="${pizza.proteiini}" />
														g hiilihydraatti:
														<c:out value="${pizza.hiilihydraatti}" />
														g rasva:
														<c:out value="${pizza.rasva}" />
														g
													</p>
												</div>
												<br />
												<p class="hinta">
													<fmt:formatNumber value="${pizza.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<!-- Lisätään pizza ostoskoriin napin avulla -->
												<form action="lisaa_pizza_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${pizza.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							
							<div class="row">
								<c:forEach items="${pizzat}" begin="4" end="7" var="pizza">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${pizza.numero == 5}">
													<img src="img/5.png" alt="empire">
												</c:when>
												<c:when test="${pizza.numero == 6}">
													<img src="img/6.png" alt="bacon">
												</c:when>
												<c:when test="${pizza.numero == 7}">
													<img src="img/7.png" alt="vave">
												</c:when>
												<c:otherwise>
													<img src="img/8.png" alt="vegeamericano">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${pizza.numero}" />
													.
													<c:out value="${pizza.nimi}" />
												</h3>
												<p>
													Täytteet: <br/>
													<c:forEach items="${pizza.taytteet}" var="tayte">
														<c:out value="${tayte.nimi}" />
													</c:forEach>
												</p>
												
												<button class="ravintoarvotBut btn btn-primary">
													<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${pizza.energia}" />
														kcal proteiini:
														<c:out value="${pizza.proteiini}" />
														g hiilihydraatti:
														<c:out value="${pizza.hiilihydraatti}" />
														g rasva:
														<c:out value="${pizza.rasva}" />
														g
													</p>
												</div>
												<br />

												<p class="hinta">
													<fmt:formatNumber value="${pizza.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<form action="lisaa_pizza_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${pizza.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="row">
								<c:forEach items="${pizzat}" begin="8" end="11" var="pizza">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${pizza.numero == 9}">
													<img src="img/9.png" alt="tropicalchicken">
												</c:when>
												<c:when test="${pizza.numero == 10}">
													<img src="img/10.png" alt="vege">
												</c:when>
												<c:when test="${pizza.numero == 11}">
													<img src="img/11.png" alt="pepperoni">
												</c:when>
												<c:otherwise>
													<img src="img/12.png" alt="chickenfeta">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${pizza.numero}" />
													.
													<c:out value="${pizza.nimi}" />
												</h3>
												<p>
													Täytteet: <br>
													<c:forEach items="${pizza.taytteet}" var="tayte">
														<c:out value="${tayte.nimi}" />
													</c:forEach>
												</p>

												<button class="ravintoarvotBut btn btn-primary">
													<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${pizza.energia}" />
														kcal proteiini:
														<c:out value="${pizza.proteiini}" />
														g hiilihydraatti:
														<c:out value="${pizza.hiilihydraatti}" />
														g rasva:
														<c:out value="${pizza.rasva}" />
														g
													</p>
												</div>
												<br />

												<p class="hinta">
													<fmt:formatNumber value="${pizza.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<form action="lisaa_pizza_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${pizza.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>	<!-- PIZZALISTA PÄÄTTYY -->

						<!-- JUOMALISTA ALKAA -->

						<div id="juomalista" class="tab-pane fade">
							<div class="row">
								<c:forEach items="${juomat}" begin="0" end="3" var="juoma">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${juoma.numero == 1}">
													<img src="img/j1.png" alt="cocacola">
												</c:when>
												<c:when test="${juoma.numero == 2}">
													<img src="img/j2.png" alt="cocacolalight">
												</c:when>
												<c:when test="${juoma.numero == 3}">
													<img src="img/j3.png" alt="fanta">
												</c:when>
												<c:otherwise>
													<img src="img/j4.png" alt="7up">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${juoma.numero}" />
													.
													<c:out value="${juoma.nimi}" />
												</h3>
												<p>
													<c:out value="${juoma.maara}" />
													ml
												</p>
												
												<button class="ravintoarvotBut btn btn-primary">
													<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${juoma.energia}" />
														kcal proteiini:
														<c:out value="${juoma.proteiini}" />
														g hiilihydraatti:
														<c:out value="${juoma.hiilihydraatti}" />
														g rasva:
														<c:out value="${juoma.rasva}" />
														g
													</p>
												</div>
												<br />

												<p class="hinta">
													<fmt:formatNumber value="${juoma.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<!-- juoma lisätään ostoskoriin napin avulla -->
												<form action="lisaa_juoma_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${juoma.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="row">
								<c:forEach items="${juomat}" begin="4" end="7" var="juoma">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${juoma.numero == 5}">
													<img src="img/j5.png" alt="mountaindew">
												</c:when>
												<c:when test="${juoma.numero == 6}">
													<img src="img/j6.png" alt="energiajuoma">
												</c:when>
												<c:when test="${juoma.numero == 7}">
													<img src="img/j7.png" alt="vihersmoothie">
												</c:when>
												<c:otherwise>
													<img src="img/j8.png" alt="persikka-mango-smoothie">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${juoma.numero}" />
													.
													<c:out value="${juoma.nimi}" />
												</h3>
												<p>
													<c:out value="${juoma.maara}" />
													ml
												</p>

												<button class="ravintoarvotBut btn btn-primary">
													<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${juoma.energia}" />
														kcal proteiini:
														<c:out value="${juoma.proteiini}" />
														g hiilihydraatti:
														<c:out value="${juoma.hiilihydraatti}" />
														g rasva:
														<c:out value="${juoma.rasva}" />
														g
													</p>
												</div>
												<br />

												<p class="hinta">
													<fmt:formatNumber value="${juoma.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<form action="lisaa_juoma_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${juoma.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="row">
								<c:forEach items="${juomat}" begin="8" end="11" var="juoma">
									<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
										<div class="thumbnail">
											<c:choose>
												<c:when test="${juoma.numero == 9}">
													<img src="img/j9.png" alt="vesimelonimehu">
												</c:when>
												<c:when test="${juoma.numero == 10}">
													<img src="img/j10.png" alt="hedelmämehu">
												</c:when>
												<c:when test="${juoma.numero == 11}">
													<img src="img/j11.png" alt="mehu">
												</c:when>
												<c:otherwise>
													<img src="img/j12.png" alt="vesi">
												</c:otherwise>
											</c:choose>
											<div class="caption">
												<h3>
													<c:out value="${juoma.numero}" />
													.
													<c:out value="${juoma.nimi}" />
												</h3>
												<p>
													<c:out value="${juoma.maara}" />
													ml
												</p>

												<button class="ravintoarvotBut btn btn-primary">
													<span class="glyphicon glyphicon-chevron-down"></span>
													Ravintoarvot
												</button>
												<br />
												<div class="ravintoarvotDiv">
													<p class="tuotetiedot">
														Tuotetiedot: energia:
														<c:out value="${juoma.energia}" />
														kcal proteiini:
														<c:out value="${juoma.proteiini}" />
														g hiilihydraatti:
														<c:out value="${juoma.hiilihydraatti}" /> g rasva:
														<c:out value="${juoma.rasva}" /> g
													</p>
												</div>
												<br />

												<p class="hinta">
													<fmt:formatNumber value="${juoma.hinta}" minFractionDigits="2"></fmt:formatNumber> €
												</p>
												<form action="lisaa_juoma_ostoskoriin" method="post">
													<p>
														<input type="hidden" name="id" value="<c:out value="${juoma.id}"/>">
														<button type="submit" class="btn btn-default ostosnappi">Lisää ostoskoriin</button>
													</p>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

						</div>
					</div>	<!-- JUOMALISTA PÄÄTTYY -->
					<!-- tilauksen jättäminen puhelimitse -->
					<p>
						Tilauksen voi jättää myös puhelimitse <br> <span class="glyphicon glyphicon-earphone" style="margin-right: 5px; color: #42DCA3;" aria-hidden="true"></span>
						<span style="font-size: 26px;"> 050-3256953</span>
					</p>

				</div>
			</div>
		</div>
	</section>
	<!-- Yhteystiedot -->
	<section id="yhteystiedot" class="container text-center">
		<br/><br/><br/>
		<h2>Yhteystiedot</h2>
		<div class="row">
			<div class="col-lg-6">	
				<br/>
				<h3 class="yt-nimi">Pizza Blue</h3>
				<br/> <br/>
				<p>
					Ratapihantie 13<br/> 00520 HELSINKI<br/> Puh. 050-3256953
				</p>
				<p class="palvelemme">Palvelemme:</p>
				<p>
					Ma - to ja su 10 - 21<br> Pe - la 10 - 22
				</p>

				<!-- Tähtiarviointi -->
				<div class="center-block" id="ratingbox">
					<input id="input-22" data-min="0" data-show-clear="false" data-max="5" data-step="1" value="0">
				</div>
				<!-- napit sosiaaliselle medialle -->
				<ul class="list-inline banner-social-buttons">
					<li><a href="https://facebook.com" class="btn btn-default btn-lg" target="_blank">
						<i class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
					</li>
					<li><a href="https://twitter.com" class="btn btn-default btn-lg" target="_blank">
						<i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
					</li>
					<li><a href="https://plus.google.com/" class="btn btn-default btn-lg" target="_blank">
						<i class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
					</li>
				</ul>
			</div>
			<!-- Palautelomake -->
            <div class="col-lg-4">
                <br/><h3>Palautelomake</h3>
                <form action="FeedbackMail" method="post">
                	<div class="form-group col-xs-6">
                		<label for="nimi">Nimi: </label><input class="form-control" type="text" id="nimi" name="nimi" style="color:black" required>
                	</div>
                	<div class="form-group col-xs-6">
                		<label for="puhelin">Puhelin: </label><input class="form-control" type="tel" placeholder="040XXXXXXX" pattern="[0-9]{10}" id="puhelin" name="puhelinnumero" style="color:black" oninvalid="setCustomValidity('Syötä vain numeroita! ')" onchange="try{setCustomValidity('')}catch(e){}">
                	</div>
                	<div class="form-group col-xs-12">
                		<label for="sahkoposti">Sähköposti: </label><input class="form-control" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" id="sahkoposti" name="sahkoposti" style="color:black" oninvalid="setCustomValidity('Syötä sähköposti oikeassa muodossa (nimi@maili.com) ')" onchange="try{setCustomValidity('')}catch(e){}" required >
                	</div>
                	<div class="form-group col-xs-12">
                		<label for="viesti">Viesti: </label><textarea class="form-control" id="viesti" name="viesti" rows="8" cols="40" style="color:black" required></textarea>
                	</div>
                	<button class="btn btn-default" type="submit" >Lähetä</button>
                </form>
               <!--   <img class="ateria img-responsive center-block" src="img/Ateria.png" style="height: 200px; width: 300px;" alt="ateria"> -->
            </div>
         </div>
    </section>

    <!-- Kartta -->
    <div id="map"></div>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; Ryhmä Blue 2015</p>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLzlVolWKgTA4-xE4KM7q28rG4BfP1agg&sensor=false"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>
    
    <!-- Tähtiarvointi -->
    <script src="js/star-rating.min.js" type="text/javascript"></script>
    
    <!-- Tähtiarvioinnin tähtien tekstilliset vastineet, ravintoarvot tulee klikattaessa esiin ja menee pois -->
    <script>

    $(document).ready(function() {
    	$("#input-22").rating({
        	starCaptions: {1: "Kamala", 2: "Huono", 3: "Keskinkertainen", 4: "Hyvä", 5: "Erinomainen"},
        	starCaptionClasses: {1: "text-danger", 2: "text-warning", 3: "text-info", 4: "text-primary", 5: "text-success"},
    	});
    	$("#rating-stars").click(function(){
    		$("span").text("Kiitos arviostasi!");
    	});
    	
    	$('.ravintoarvotBut').click(function() {
    		  //Use the current button which triggered the event
    		  $(this).siblings('.ravintoarvotDiv').slideToggle();
    		  $(this).find('.glyphicon').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-up');	  
    	});
    	
    	$(".ostosnappi").click(function() {
    		$(".glyphicon-shopping-cart").css("color", '#FF1975');
    	});
    });
    </script>

</body>

</html>
