public class Calendar : Service
{

	//ShadowedLabel label;

	public Calendar ()
	{
		base ("calendar");
		
		load();
	}

	public override void create ()
	{
		var label = new ShadowedLabel ("<span color='" + textcolor + "' face='Raleway' font='20'>Calendar</span>");
		var content = new ShadowedLabel ("<span color='" + textcolor + "' face='Raleway' font='19'> " + "	January	" + " </span>\n" +
				"<span color='" + textcolor + "' face='Freemono' font='13'>S  M  T  W  T  F  S </span>\n" + 
				"<span color='" + textcolor + "' face='Freemono' font='13'>" + "   1  2  3  4  5  6\n7  8  9 ..." + "</span>");
				
		label.x = 0;
		label.y = 0;
		content.x = 2;
		content.y = label.height + 12;
		
		add_child (label);
		add_child (content);
	}
    public override bool update () {
        //TODO	
        return true;
    }
}


/* public class Calendar : Service
{
	GData.CalendarService service;
	GData.CalendarEvent current_event = null;

	ShadowedLabel label;

// calendar names that are accepted as a list
	string [] accept = {""};

	string time;
	string place = "";

	public Calendar ()
	{
		base ("calendar");

		label = new ShadowedLabel ("");
		label.opacity = 0;
		add_child (label);

		try {
			var auths = new List<GData.AuthorizationDomain> ();
			auths.append (GData.CalendarService.get_primary_authorization_domain ());
			var auth = new GData.ClientLoginAuthorizer.for_authorization_domains ("weather", auths);
			auth.authenticate ("loginname", "password", null);
			service = new GData.CalendarService (auth);

			if (service == null)
				return;

			// let's see which calendar got the most recent event
			var query = new GData.CalendarQuery (null);
			query.start_min = new DateTime.now_local ().to_unix ();
			query.is_strict = true;
			query.future_events = true;
			query.order_by = "starttime";
			query.sort_order = "ascending";
			query.max_results = 1;

			var calendars = service.query_all_calendars (null, null, null);
			foreach (var calendar in calendars.get_entries ()) {
				if (!(calendar.title in accept))
					continue;

				var res = service.query_events (calendar as GData.CalendarCalendar, query, null, null);
				var new_event = res.get_entries ().nth_data (0) as GData.CalendarEvent;
				print ("CALENDAR: %s\n", calendar.title);
				foreach (var ev in res.get_entries ())
					print ("\tEVENT: %s\n", ev.title);
				if (current_event == null || new_event.get_times ().nth_data (0).start_time < current_event.get_times ().nth_data (0).start_time)
					current_event = new_event;
			}

			if (current_event == null)
					return;

			time = new DateTime.from_unix_local (current_event.get_times ().nth_data (0).start_time).format ("%H:%M");
			if (current_event.get_places ().length () > 0 && current_event.get_places ().nth_data (0).label != null) {
					place = "@" + current_event.get_places ().nth_data (0).label;
			}
		} catch (Error e) { warning (e.message); }
	}

	public override void create ()
	{
		var label = new ShadowedLabel ("<span color='" + textcolor + "' face='wallstate' font='42'>i</span>"+
				"<span color='" + textcolor + "' face='Raleway' weight='100' font='72'> " + time + " </span>\n" +
				"<span color='" + textcolor + "' face='Open Sans Light' font='24'> " + current_event.title + place + " </span>");
		add_child (label);
	}
    public override bool update () {
        //TODO	
        return true;
    }
} */
