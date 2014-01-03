const string stocks_watch = "AAPL,GOOG,MSFT";

public class Stocks : Service 
{
	Soup.Session session;
	Soup.Message message;
	ShadowedLabel reload;
	ShadowedLabel main_label;
	ShadowedLabel stocks_list;
	
	public Stocks ()
	{
		base ("stocks");
        	load();
	}
	
	public override void create ()
	{
		var main_label = new ShadowedLabel ("<span color='" + textcolor + "' font='20' face='Raleway'>%s</span>".printf (_("Stocks")));
		var stocks_list = new ShadowedLabel ("");
		stocks_list.y = main_label.height + 12;
		stocks_list.x = 12;  
		reload = get_reload_label(_("stocks"));
		//reload.hide();

		add_child (main_label);
		add_child (stocks_list);
		 
	    Timeout.add(10000, update); 
	}
	public override bool update ()
	{
	  	debug("Updating stocks...");
	  	//reload.hide();
	  	var soup_url = "http://download.finance.yahoo.com/d/quotes.csv?s=%40%5E" + stocks_watch + "&f=nsl1op&e=.csv";
		message = new Soup.Message ("GET", soup_url);
		
		    var output = (string)message.response_body.data;
		    if (output == null) {
		        stocks_list.hide ();
		        reload.show ();
		        return false;
		    }
		    print(output);
		
	  	
		return true;  
	}
}
