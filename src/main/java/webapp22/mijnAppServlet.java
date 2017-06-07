package webapp22;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.util.Date;
import java.util.List;

import com.googlecode.objectify.ObjectifyService;

/**
 * Servlet implementation class mijnAppServlet
 */
public class mijnAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mijnAppServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String datum = request.getParameter("datum");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date date = null;
		try {
			date = simpleDateFormat.parse(datum);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// maak een nieuwe lijst vanaf die key en stuur deze mee met de response)
		List<Invoer> nieuweLijst = ObjectifyService.ofy()
		          .load()
		          .type(Invoer.class) // We want only Greetings		          
		          .filter("date < ", date)
		          .order("-date")       // Most recent first - date is indexed.
		           //.startAt("date", date)		          
		          .limit(5)             // Only show 5 of them.
		          .list();
	
		request.setAttribute("lijst", nieuweLijst);
		request.getRequestDispatcher("/publicatie.jsp").forward(request, response);
		//response.sendRedirect("/publicatie.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String invoerAanvraag = request.getParameter("aanvraag");
		String invoerLevering = request.getParameter("levering");
		Invoer invoer;
		
		invoer = new Invoer (invoerAanvraag, invoerLevering);
		
		ObjectifyService.ofy().save().entity(invoer).now();
		
		response.sendRedirect("/publicatie.jsp");
		return;
		
	
	}
	


}
