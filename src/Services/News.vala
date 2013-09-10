
public class News : Service
{
	struct News {
		string title;
		string url;
	}

	Settings settings;
	Soup.Session session;
	Soup.Message message;
	ShadowedLabel label_list;
	ShadowedLabel reload;
	News[] news;

	public News ()
	{
		base ("news");
        reload = get_reload_label(_("news"));
		reload.hide();
		label_list = new ShadowedLabel("");
		label_list.hide();
	    label_list.reactive = true;
	    label_list.button_release_event.connect ((e) => {
		    float root_x, root_y;
		    label_list.get_transformed_position (out root_x, out root_y);
		    var url = news[int.min ((int)((e.y - root_y) / ((label_list.height - 20) / 10.0f)), 9)].url;
		    var uris = new List<string> ();
		    uris.append (url);
		    try {
			    AppInfo.get_default_for_uri_scheme ("http").launch_uris (uris, null);
		    } catch (Error e) { warning (e.message); }

		    return true;
	    });
		settings = new Settings ("org.pantheon.gazette.news");
		settings.changed.connect( (key) => { if (key != "update-interval") update(); });
		session = new Soup.SessionAsync ();
        load();
	    Timeout.add(settings.get_int("update-interval"), update);
		var label = new ShadowedLabel ("<span font='20' face='Raleway'>%s</span>".printf (_("News")));
		label_list.y = label.height + 12;
		label_list.x = 12;
        reload.y = label_list.y;
        reload.x = label_list.x;
		add_child (label);
		add_child(reload);
		add_child (label_list);
	}

	public override void create ()
	{
		
	}
	public override bool update ()
	{   debug("Updating News");
	    reload.hide();
	    label_list.reactive = false;
	    label_list.show();
	    label_list.label = "<span face='Open Sans Light' font='16'>" + _("Loading news,\nplease wait.") + "</span>";
        var soup_url = settings.get_string ("rss-url");
		message = new Soup.Message ("GET", soup_url);
	    session.queue_message (message, (session, m) => 
	    {
		    var output = (string)m.response_body.data;
            if (output == null) {
                label_list.hide ();
                reload.show ();
                return;
            }
		    var offset = output.index_of ("<item>");
		    news = new News[10];
		    for (var i = 0; i < 10; i++) {
			    offset = output.index_of ("<title>", offset) + 7;
			    var title = output.substring (offset, output.index_of ("</title>", offset) - offset);
			    offset = output.index_of ("<link>", offset) + 6;
			    var url = output.substring (offset, output.index_of ("</link>", offset) - offset);
			    news[i] = {ellipsize(title, 40), url};
		    }
		    var list = "<span font='12' face='Open Sans'>";
		    for (var i = 0; i < news.length; i++) {
			    list += news[i].title + "\n";
		    }
		    label_list.label = list + "</span>";
		    label_list.reactive = true;
		});
	    return true;
	}
	
}


