using Clutter;

public class GlobalSettings : Granite.Services.Settings
{
	public string[] services_enabled { get; set; }

	static GlobalSettings? instance;

	public GlobalSettings ()
	{
		base ("org.pantheon.gazette");
	}

	public static GlobalSettings get_default ()
	{
		if (instance == null)
			instance = new GlobalSettings ();

		return instance;
	}
}

public class Gazette : Granite.Application
{
	construct
	{
		program_name = "Gazette";
		application_id = "org.pantheon.gazette";
	}

	const int MARGIN = 50;

	public Gazette ()
	{
	}

	public override void activate ()
	{
		if (get_windows ().length () > 0)
			return;

		var window = new GazetteWindow ();
		window.set_application (this);
		var size = window.reposition ();
		window.show_all ();

		var welcome = new ShadowedLabel("<span font='50' face='Raleway'>%s</span>".printf (_("Welcome") + ", " + Environment.get_real_name ()));
		welcome.x = 50;
		welcome.y = 200;
		welcome.opacity = 0;
		welcome.animate (AnimationMode.LINEAR, 500, opacity : 255, x : 100.0f).get_timeline ().completed.connect (() => {
			welcome.animate (AnimationMode.LINEAR, 1000, x : 200.0f).get_timeline ().completed.connect (() => {
				welcome.animate (AnimationMode.LINEAR, 500, x : 250.0f, opacity : 0);
			});
		});
		window.stage.add_child (welcome);
var randomlinetext = "______________________________________";
        var randomline1 = new ShadowedLabel("<span font='10' face='FreeMono'>%s</span>".printf (_(randomlinetext)));
		randomline1.x = 760;
		randomline1.y = 260;
		randomline1.opacity = 0;
        randomline1.scale_x= welcome.width / ( randomline1.width );
		randomline1.animate (AnimationMode.EASE_IN_QUAD, 900, opacity : 255, x : 100.0f ).get_timeline ().completed.connect (() => {
			randomline1.animate (AnimationMode.LINEAR, 10, x : 75.0f).get_timeline ().completed.connect (() => {
				randomline1.animate (AnimationMode.EASE_OUT_QUAD, 1000, x : 50.0f, opacity : 0);
			});
		});

		window.stage.add_child (randomline1);
        var randomline2 = new ShadowedLabel("<span font='10' face='FreeMono'>%s</span>".printf (_(randomlinetext)));
		randomline2.x = 50;
		randomline2.y = 195;
		randomline2.opacity = 0;
        randomline2.scale_x= welcome.width / ( randomline2.width );
		randomline2.animate (AnimationMode.EASE_IN_QUAD, 700, opacity : 255, x : 600.0f ).get_timeline ().completed.connect (() => {
			randomline2.animate (AnimationMode.LINEAR, 1, x : 700.0f).get_timeline ().completed.connect (() => {
				randomline2.animate (AnimationMode.EASE_OUT_QUAD, 1000, x : 760.0f, opacity : 0);
			});
		});
		window.stage.add_child (randomline2);

		//var calendar = new Calendar();

        Timeout.add(2000, () => {
		    var list = GlobalSettings.get_default ().services_enabled;
		    for (var i = 0; i < list.length; i++) {
			    string id;
			    int x, y;

			    parse_coords (list[i], out id, out x, out y);

			    switch (id) {
				    case "files":
				        var files = new Files ();
					    files.x = x > 0 ? x : size[0] - MARGIN - 340;
					    files.y = y > 0 ? y : MARGIN + 260;
					    window.stage.add_child (files);
					    break;
				    case "weather":
				        var weather = new Weather ();
					    weather.x = x > 0 ? x : size[0] - MARGIN - 340;
					    weather.y = y > 0 ? y : MARGIN;
					    window.stage.add_child (weather);
					    break;
				    case "news":
				        var news = new News ();
					    news.x = x > 0 ? x : size[0] - MARGIN - 340;
        				news.y = y > 0 ? y : MARGIN + 560;
       					window.stage.add_child (news);
					    break;
				    default:
					    warning ("Unrecognized service requested!");
					    break;
			    }
		    }
			    //calendar.create ();
			    //calendar.x = size[0] - MARGIN - 340;
			    //calendar.y = MARGIN + 750;
			    //calendar.display ();
			    //window.stage.add_child (calendar);
			return false;
        });
	}

	void parse_coords (string service, out string id, out int x, out int y)
	{
		var parts = service.split (":");
		id = parts[0];
		if (parts.length < 2) {
			x = -1;
			y = -1;
			return;
		}

		var coords = parts[1].split (",");

		x = int.parse (coords[0]);
		y = int.parse (coords[1]);
	}
}

int main (string [] args)
{
	GtkClutter.init (ref args);

	return new Gazette ().run (args);
}

