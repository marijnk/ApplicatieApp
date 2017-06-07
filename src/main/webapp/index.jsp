<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="webapp22.Invoer" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invulpagina</title>
 <link href="bootstrap.min.css" rel="stylesheet">
	
	<link href="ionicons.min.css" rel="stylesheet">
	<link href="/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>Aanvraag en levering</h1>
	
	<form class="form-group" action="/mijnAppServlet" method="post">
		<fieldset>
			<label>Aanvraag </label>
				<div class="veld_reset">
				<textarea class="tekstveld" name="aanvraag" value="" maxlength="100"> </textarea>
				<input type="reset" class="x" name="x" value="X"/>				
				</div>			
		</fieldset>
		<fieldset > 
			<label>Levering </label>
				<div class="veld_reset">
				<textarea class="tekstveld" name="levering" value="" maxlength="100"> </textarea>
				<input type="reset" class="x" name= "x" value="X"/>
				</div>
		</fieldset>
		<input type="submit" class="submit" value="publiceer"/>
	</form>
		
</body>
</html>