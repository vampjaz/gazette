namespace Gazette {
    
    public class RSS : Gazette.Service {
        

        public string rss_url = "";
        public int update_interval = 0;

	    Settings settings;

        public RSS (){
            base ("RSS " + _("News"), "internet-news-reader");
            
		    settings = new Settings ("org.pantheon.gazette.news");

            // VAR INIT
            try {
                rss_url = settings.get_string("rss-url");
                update_interval = settings.get_int("update-interval");
            }
            catch (Error e) {
                stderr.printf ("Unable to find settings: %s\n", e.message);
            }

            
            // URL LABEL
            var rssLabel = new Gtk.Label (_("URL") + " :");
		    this.container.attach(rssLabel, 0, 0, 1, 1);
            rssLabel.set_alignment (1, 0);
            
            // URL ENTRY
            var rssEntry = new Gtk.Entry ();
            rssEntry.set_text (this.rss_url);
		    this.container.attach(rssEntry, 1, 0, 2, 1);

            rssEntry.changed.connect (() => {

            settings.set_string("rss-url", rssEntry.get_text ());
            });

            // REFRESH LABEL
            var refreshLabel = new Gtk.Label (_("Refresh Interval") + " :");
		    this.container.attach(refreshLabel, 0, 1, 1, 1);
            refreshLabel.set_alignment (1, 0);
            
            // REFRESH ENTRY
            var scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0, 3600000, 60000);
            scale.set_draw_value (false);
            scale.add_mark (300000, Gtk.PositionType.BOTTOM, _("5 min"));
            scale.add_mark (1200000, Gtk.PositionType.BOTTOM, _("20 min"));
            scale.add_mark (2400000, Gtk.PositionType.BOTTOM, _("40 min"));
            scale.add_mark (3600000, Gtk.PositionType.BOTTOM, _("1 hour"));

            scale.set_value (update_interval);

            scale.value_changed.connect (() => {

            settings.set_int("update-interval", (int) scale.get_value() );
            });

		    this.container.attach(scale, 1, 1, 2, 1);
		    
            // RESET BUTTON
            var resetButton = new Gtk.Button.with_label ( _("Reset") );
		    this.container.attach(resetButton, 2, 2, 1, 1);
            resetButton.clicked.connect(() => {
                settings.reset ("rss-url");
                settings.reset ("update-interval");
                rss_url = settings.get_string("rss-url");
                update_interval = settings.get_int("update-interval");
                rssEntry.set_text (this.rss_url);
                scale.set_value (update_interval);
            });
        }
        
        public override void run (File file){
            /*
            string content;
            try{
                FileUtils.get_contents (file.get_path (), out content);
            }catch (Error e){warning (e.message);}
            
            var command = "xdg-open 'http://www.wikipedia.org/wiki/"+content+"'";
            
            string ret;
            try{
                Process.spawn_command_line_sync (command, out ret);
            }catch (Error e){error (e.message);}
*/
        }
    }
}
