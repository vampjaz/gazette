
public class GazetteWindow : Granite.Widgets.CompositedWindow
{
	public Clutter.Stage stage {
		get {
			return embed.get_stage () as Clutter.Stage;
		}
		private set {}
	}

	GtkClutter.Embed embed;

	public GazetteWindow ()
	{
		type_hint = Gdk.WindowTypeHint.DESKTOP;
		resizable = true;

		embed = new GtkClutter.Embed ();
		stage.use_alpha = true;
		stage.background_color = {0, 0, 0, 0};
		add (embed);
	}

	public int[] reposition ()
	{
		Gdk.Rectangle geom;
		Gdk.Screen.get_default ().get_monitor_geometry 
			(Gdk.Screen.get_default ().get_primary_monitor (), out geom);

		move (geom.x, geom.y);
		resize(Gdk.Screen.get_default().width(), Gdk.Screen.get_default().height());

		return { geom.width, geom.height };
	}
}

