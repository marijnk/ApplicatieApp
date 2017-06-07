<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webapp22.Invoer" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Publicatie pagina</title>
 <!-- Bootstrap Core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">
	
	<link href="ionicons.min.css" rel="stylesheet">
	<link href="/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>Publicaties</h1>
	
	<div class="zoekveld">
	<form action="/index.jsp" class="zoekbalk">
		<input type="submit" id="button" value="Terug"/>
	</form>
	<form action="/NieuweLijstServlet" method="get" class="zoekbalk">
		<fieldset id="zoekbar">
			<input type="search" id="search" name="zoeken" placeholder="zoeken (zoektermen met komma's scheiden)" value=""/>		
			<input type="submit" id="zoekknop" value="zoek"/> 
		</fieldset>
	</form>
   </div>

<%	
	List<Invoer> invoerlijst = (List<Invoer>) request.getAttribute("lijst");

	if (invoerlijst == null){
	
    invoerlijst = ObjectifyService.ofy()
          .load()
          .type(Invoer.class) // We want only Greetings
          .order("-date")       // Most recent first - date is indexed.
          .limit(5)             // Only show 5 of them.
          .list();

	}
%>
<div class="container">
	<div class="row">
<%
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				
        for (Invoer invoer: invoerlijst){
        	
        	pageContext.setAttribute("aanvraag_content", invoer.aanvraag);
            pageContext.setAttribute("levering_content", invoer.levering);
            String datum = df.format(invoer.date);
            pageContext.setAttribute("invoer_datum", datum);
            
%>

 			<div class="col-xs-6 col-sm-4">
				<div class="vakken">
				<p>Aanvraag</p>
				<div class="aanvrdiv"> <p>${aanvraag_content}</p></div>
				<p>Levering</p>
				<div class="levdiv"><p>${levering_content}</p></div>
				<p>Ingevoerd op: ${invoer_datum}</p>				
			</div>
			</div>
			
<%
        }
      if (invoerlijst.size()< 5){
    	  for (int j = 0; j<(5-invoerlijst.size()); j++){
%>
    	<div class="col-xs-6 col-sm-4">
				<div class="vakken">
				<p>Aanvraag</p>
				<div class="aanvrdiv"></div>
				<p>Levering</p>
				<div class="levdiv"></div>
				<p>Ingevoerd op:</p>
			</div>
			</div>	 
<% 
    	  }
      }
    	 else{
    
	
      DateFormat uitgebreid = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
      
      Invoer laatsteInvoer = (Invoer) invoerlijst.get(4);      
	  Date laatsteDatum = laatsteInvoer.date;
		
		String doorgeefDatum = uitgebreid.format(laatsteDatum);
		pageContext.setAttribute("laatste_datum", doorgeefDatum);
		
    	 }
      
%>
 
	


	
	<div class="col-xs-6 col-sm-4" id="laadmeer">
		<form action="/mijnAppServlet" method="get">
		<input type="hidden" name="datum" value="${laatste_datum}"/>
		<input type="submit" class="laadmeer" value="Laad meer..." />
		</form>
 </div>
 </div>
 </div>

</body>
</html>