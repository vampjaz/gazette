
const string [] condition_codes = {
	"c", // tornado
	"0", // tropical storm
	"c", // hurricane
	"1", // severe thunderstorms
	"1", // thunderstorms
	"2", // mixed rain and snow
	"3", // mixed rain and sleet
	"2", // mixed snow and sleet
	"e", // freezing drizzle
	"3", // drizzle
	"7", // freezing rain
	"3", // showers
	"3", // showers
	"6", // snow flurries
	"G", // light snow showers G
	"#", // blowing snow #
	"h", // snow "
	"7", // hail
	"7", // sleet 
	"f", // dust
	"f", // foggy 
	"f", // haze
	"M", // smoky M
	"c", // blustery 
	"S", // windy S
	"h", // cold
	"N", // cloudy N
	"4", // mostly cloudy (night) 4
	"3", // mostly cloudy (day) 3
	"K", // partly cloudy (night) K
	"J", // partly cloudy (day) J
	"C", // clear (night) C
	"B", // sunny B
	"2", // fair (night) 2
	"B", // fair (day)  B
	"X", // mixed rain and hail X
	"1", // hot 1
	"1", // isolated thunderstorms
	"1", // scattered thunderstorms
	"1", // scattered thunderstorms
	"e", // scattered showers
	"#", // heavy snow #
	"2", // scattered snow showers
	"#", // heavy snow #
	"H", // partly cloudy H
	"1", // thundershowers
	"2", // snow showers
	"1", // isolated thundershowers
	")" // not available )
};

public class Weather : Service
{
    string [] condition_texts = {
        	_("Tornado"), // tornado
	        _("Tropical storm"), // tropical storm
	        _("Hurricane"), // hurricane
	        _("Severe thunderstorms"), // severe thunderstorms
	        _("Thunderstorms"), // thunderstorms
	        _("Mixed rain and snow"), // mixed rain and snow
	        _("Mixed rain and sleet"), // mixed rain and sleet
	        _("Mixed snow and sleet"), // mixed snow and sleet
	        _("Freezing drizzle"), // freezing drizzle
	        _("Drizzle"), // drizzle
	        _("Freezing rain"), // freezing rain
	        _("Showers"), // showers
	        _("Showers"), // showers
	        _("Snow flurries"), // snow flurries
	        _("Light snow showers"), // light snow showers G
	        _("Blowing snow"), // blowing snow #
	        _("Snow"), // snow "
	        _("Hail"), // hail
	        _("Sleet"), // sleet 
	        _("Dust"), // dust
	        _("Foggy"), // foggy 
	        _("Haze"), // haze
	        _("Smoky"), // smoky M
	        _("Blustery"), // blustery 
	        _("Windy"), // windy S
	        _("Cold"), // cold
	        _("Cloudy"), // cloudy N
	        _("Mostly cloudy"), // mostly cloudy (night) 4
	        _("Mostly cloudy"), // mostly cloudy (day) 3
	        _("Partly cloudy"), // partly cloudy (night) K
	        _("Partly cloudy"), // partly cloudy (day) J
	        _("Clear"), // clear (night) C
	        _("Sunny"), // sunny B
	        _("Fair"), // fair (night) 2
	        _("Fair"), // fair (day)  B
	        _("Mixed rain and hail"), // mixed rain and hail X
	        _("Hot"), // hot 1
	        _("Isolated thunderstorms"), // isolated thunderstorms
	        _("Scattered thunderstorms"), // scattered thunderstorms
	        _("Scattered thunderstorms"), // scattered thunderstorms
	        _("Scattered showers"), // scattered showers
	        _("Heavy snow"), // heavy snow #
	        _("Scattered snow showers"), // scattered snow showers
	        _("Heavy snow"), // heavy snow #
	        _("Partly cloudy"), // partly cloudy H
	        _("Thundershowers"), // thundershowers
	        _("Snow showers"), // snow showers
	        _("Isolated thundershowers"), // isolated thundershowers
	        _("Not available") // not available )
    };

    string [] day_texts = {
    		_("Mon"),
    		_("Tue"),
    		_("Wed"),
    		_("Thu"),
    		_("Fri"),
    		_("Sat"),
    		_("Sun")
    };

	string unit;
	string text;
    Soup.SessionAsync session;
    Soup.Message message;
	Settings settings;
	ShadowedLabel label;
	ShadowedLabel reload;

	public Weather ()
	{
		base ("weather");
		settings = new Settings ("org.pantheon.gazette.weather");
		settings.changed.connect( (key) => { update(); });
        label = new ShadowedLabel("");
        reload = get_reload_label(_("weather"));
        reload.hide();
		session = new Soup.SessionAsync ();
		add_child (label);
		add_child (reload);
        load();
	    Timeout.add(settings.get_int("update-interval"), update); 
	}

	public override void create ()
	{

	}

	public string[] get_attributes (string data, string tagname, string [] attrs, int offset = 0)
	{
		var start = data.index_of ("<" + tagname, offset) + tagname.length + 1;
		var end = data.index_of ("/>", start);
		var tmp_data = data.substring (start, end - start);
 
		var res = new string[attrs.length];
		for (var i = 0; i < attrs.length; i++) {
				res[i] = get_attribute_value (tmp_data, attrs[i]);
		}
		return res;
	}

	public string get_attribute_value (string data, string attr)
	{
		var start = data.index_of (attr + "=\"") + attr.length + 2;
		var end = data.index_of ("\"", start);
 
		return data.substring (start, end - start);
	}
	public override bool update() {
	    debug ("Updating Weather");
	    reload.hide ();
	    label.label = "<span face='Open Sans Light' font='16'>" + _("Loading weather,\nplease wait.") + "</span>";
	    label.show ();
		string id = settings.get_int ("weather-id").to_string();
		unit = settings.get_string ("weather-unit") == "Fahrenheit" ? "f" : "c";
		var url = "http://weather.yahooapis.com/forecastrss";
		url += "?u=" + unit;
		url += "&w=" + id;
		message = new Soup.Message ("GET", url);
	    session.queue_message(message, (session, m) => {
            var data = (string)message.response_body.data;
            if (data == null) {
                label.hide ();
                reload.show ();
                return;
            }
            
			var current = get_attributes (data, "yweather:condition", {"temp", "text", "code"});
			var forecast = get_attributes (data, "yweather:forecast", {"day", "date", "low", "high", "text", "code"},
				data.index_of ("<yweather:forecast"));
			var forecast2 = get_attributes (data, "yweather:forecast", {"day", "date", "low", "high", "text", "code"},
				data.index_of ("<yweather:forecast") + 10);

			var today = new DateTime.now_local ().format (_("%A"));
 
			text = 
                "<span face='Open Sans Light' font='24'>" + today + "</span>" +
                "<span face='Open Sans Light' font='16'> // <i>" + condition_texts[int.parse (current[2])] +"</i></span>\n" +
				"<span face='gazetteweather' font='68'>" + condition_codes[int.parse (current[2])] + "</span>" +
				"<span face='Raleway' weight='100' font='72'> " + current[0] + "</span>" +
				"<span face='Raleway' weight='100' font='40'> ° " + unit.up () + "</span>\n" + 

				"<span face='gazetteweather' font='30'>" + condition_codes[int.parse (forecast[5])] + "</span>" +
				"<span face='Open Sans Light' font='26'> " + _(forecast[0]) + "     </span>" + 
				"<span face='gazetteweather' font='30'>" + condition_codes[int.parse (forecast2[5])] + "</span>" +
				"<span face='Open Sans Light' font='26'> " + _(forecast2[0]) + "</span>\n"+

				"<span face='Raleway' font='21'>" + forecast[2] + " - " + forecast[3] +"°"+unit.up()+"      </span>"+
				"<span face='Raleway' font='21'>" + forecast2[2] + " - " + forecast2[3] +"°"+unit.up()+"      </span>";
			label.label = text;
	    });
	    return true;
	}
}


