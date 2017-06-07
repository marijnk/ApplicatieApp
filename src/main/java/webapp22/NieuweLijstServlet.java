package webapp22;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Query;
import com.googlecode.objectify.ObjectifyService;

/**
 * Servlet implementation class NieuweLijstServlet
 */
public class NieuweLijstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NieuweLijstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// haal zoektermen binnen
		String zoektermen = request.getParameter("zoeken");
	// maak een arraylist van deze termen, scheiden 
		List<String> zoektermenLijst = new ArrayList<String>(Arrays.asList(zoektermen.split("\\s*,\\s*")));
		List<Invoer> resultatenLijst = new ArrayList<Invoer>();
		List<Invoer> databaseInhoud = ObjectifyService.ofy()
		          .load()
		          .type(Invoer.class)	          
		          .list();
		
	// voor iedere term in de lijst de database doorzoeken. Lijst maken van alle gevonden database objecten.
		for (String zoekterm: zoektermenLijst){
			for (Invoer invoer: databaseInhoud){
				// if invoer niet in resultatenlijst
				if (!(resultatenLijst.contains(invoer))){
				if(invoer.aanvraag.toLowerCase().contains(zoekterm.toLowerCase()) || 
						invoer.levering.toLowerCase().contains(zoekterm.toLowerCase())){
					resultatenLijst.add(invoer);
				}
				}
			}			
		}
		
		if (zoektermen == ""){
			resultatenLijst.clear();
		}
		// resultatenlijst doorgeven naar resultaten.jsp.
		request.setAttribute("lijst", resultatenLijst);
		request.getRequestDispatcher("/resultaten.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
