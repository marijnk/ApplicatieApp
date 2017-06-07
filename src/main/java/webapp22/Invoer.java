package webapp22;

import java.util.Date;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

@Entity
public class Invoer {
	@Id public Long id;
	public String aanvraag;
	public String levering;
	@Index public Date date;
	
	public Invoer(){
		date = new Date();
	}
	
	public Invoer(String aanvraag, String levering){
		this();
		this.aanvraag = aanvraag;
		this.levering = levering;
	}
}


