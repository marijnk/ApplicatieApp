<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webapp22.Invoer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultaten</title>
    <link href="bootstrap.min.css" rel="stylesheet">
	
	<link href="ionicons.min.css" rel="stylesheet">
	<link href="/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>Zoekresultaten</h1>
	
<% 
	List<Invoer> resultatenlijst = (List<Invoer>) request.getAttribute("lijst");


%>
	

<div class="container">
	<div class="row">
<%
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				
        for (Invoer invoer: resultatenlijst){
        	
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
<% } %>
</div>
</div>
</body>
</html>