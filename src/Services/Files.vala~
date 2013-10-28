
public class Files : Service
{
	List<Gtk.RecentInfo> last_files;
    ShadowedLabel files_list;
    Settings settings;
    
	public Files ()
	{
		base ("files");
		last_files = Gtk.RecentManager.get_default ().get_items ();
		settings = new Settings("org.pantheon.gazette.files");
        load();
	}

	public override void create ()
	{
		var files_label = new ShadowedLabel ("<span font='20' face='Raleway'>%s</span>".printf (_("Files")));
		files_list = new ShadowedLabel ("");
		files_list.y = files_label.height + 12;
		files_list.x = 12;

		add_child (files_label);
		add_child (files_list);

		files_list.button_release_event.connect ((e) => {

			float root_x, root_y;
			files_list.get_transformed_position (out root_x, out root_y);
			var item = last_files.nth_data (int.min ((int)((e.y - root_y) / ((files_list.height - 20) / 10.0f)), 9));

			var files = new List<File> ();
			files.append (File.new_for_uri (item.get_uri ()));
			try {
				AppInfo.get_default_for_type (item.get_mime_type (), false).launch (files, null);
			} catch (Error e) { warning (e.message); }
			return true;
		});
	    Timeout.add(settings.get_int("update-interval"), update);
	}
	public override bool update ()
	{
	    debug("Updating Recent Files");
	    files_list.reactive = false;
		var res = "<span font='12' face='Open Sans'>";
		for (var i = 0; i < 10 && i < last_files.length (); i++) {
			res += ellipsize (last_files.nth_data (i).get_display_name (), 40) + "\n";
		}
		files_list.label = res + "</span>";
		files_list.reactive = true;
		return true;
	}
}

