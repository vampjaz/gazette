
public abstract class Service : Clutter.Actor
{
	uint timeout = 0;
	float start_x;
	float start_y;
	bool held = false;
    const int UPDATE_INTERVAL = 1000*60*30; //30 min, in ms.

	public string id { get; private set; }

	public Service (string _id)
	{
		id = _id;

		opacity = 0;
		reactive = true;
		scale_gravity = Clutter.Gravity.NORTH_WEST;
	}

	public override bool button_press_event (Clutter.ButtonEvent event)
	{
		timeout = Timeout.add (Clutter.Settings.get_default ().long_press_duration, long_held);
		start_x = event.x - x;
		start_y = event.y - y;

		get_stage ().captured_event.connect (intercept);

		return false;
	}

	bool long_held ()
	{
		held = true;
		animate (Clutter.AnimationMode.EASE_IN_OUT_BACK, 300, scale_x : 0.8f, scale_y : 0.8f);

		return false;
	}

	bool intercept (Clutter.Event event)
	{
		switch (event.get_type ()) {

            case Clutter.EventType.SCROLL:
                double scale_x_value = 0.0;
                double scale_y_value = 0;
                get_scale(out scale_x_value, out scale_y_value );
				
                switch (event.get_scroll_direction ()) {
                        		case Clutter.ScrollDirection.UP:
                                		animate (Clutter.AnimationMode.EASE_IN_OUT_BACK, 100, scale_x : scale_x_value * 1.1, scale_y : scale_y_value * 1.1);
                                		break;
                                case Clutter.ScrollDirection.DOWN:
                                		animate (Clutter.AnimationMode.EASE_IN_OUT_BACK, 100, scale_x : scale_x_value * 0.9, scale_y : scale_y_value * 0.9);
                                		break;

					            
				}
					return true;
				



			case Clutter.EventType.BUTTON_RELEASE:
				get_stage ().captured_event.disconnect (intercept);

				if (!held) {
					clear_timeout ();
					return false;
				}

				var list = GlobalSettings.get_default ().services_enabled;
				for (var i = 0; i < list.length; i++) {
					if (list[i].length >= id.length && list[i].substring (0, id.length) == id) {
						list[i] = id + ":" + ((int)x).to_string () + "," + ((int)y).to_string ();
						GlobalSettings.get_default ().services_enabled = list;
						break;
					}
				}

				animate (Clutter.AnimationMode.EASE_IN_OUT_BACK, 300, scale_x : 1.0f, scale_y : 1.0f);
				clear_timeout ();
				return true;
			case Clutter.EventType.MOTION:
				if (!held)
					return false;

				float ex, ey;
				event.get_coords (out ex, out ey);
				x = Math.floorf (ex - start_x);
				y = Math.floorf (ey - start_y);
				return true;
		}

		return false;
	}

	void clear_timeout ()
	{
		if (timeout > 0) {
			Source.remove (timeout);
			timeout = 0;
		}
		held = false;
	}
	
	// load method to avoid code repetition.
    public bool load() 
    {
        create ();
		update ();
		display ();
		return false;
    }
    public ShadowedLabel get_reload_label(string service_name) {
		var reload = new ShadowedLabel("<span face='Open Sans Light' font='16'>" + _("Could not retrieve ") + service_name + ",\n" + _("click here to try again") + ".</span>");
		reload.reactive = true;
		reload.button_release_event.connect(update);
		return reload;
    }
	public abstract void create (); 
    public abstract bool update (); // Update method for auto updating.
	internal void display ()
	{
		animate (Clutter.AnimationMode.LINEAR, 400, opacity : 255);
	}
	
	public static string ellipsize (string s, int max_length) {
	    string ret = s;
	    if (ret.length > max_length)
	        ret = ret.substring (0, ret.index_of_nth_char(max_length-3)) + "...";
	    debug(ret);
	    return ret;
	}
}
