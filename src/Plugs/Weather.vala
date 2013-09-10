namespace Gazette {
    
    public class Weather : Gazette.Service {
        
        public int weather_id;
        public string weather_unit = "'Celsius'";

	    Settings settings;

        public Weather () {
            base (_("Weather Forecast"), "preferences-desktop-online-accounts");
            
		    settings = new Settings ("org.pantheon.gazette.weather");

            // VAR INIT
            try {
                weather_id = settings.get_int("weather-id");
                weather_unit = settings.get_string("weather-unit");

            }
            catch (Error e) {
                stderr.printf ("Unable to find settings: %s\n", e.message);
            }
            

            // ID LABEL
            var weatherIdLabel = new Gtk.Label ("* "+ _("Location ID") + " / " +  _("Unit") + " :");
		    this.container.attach(weatherIdLabel, 0, 0, 1, 1);


            // ID ENTRY            
            var weatherIdEntry = new Gtk.SpinButton.with_range (10000, 99999999, 1);
            weatherIdEntry.set_value (this.weather_id);
            weatherIdEntry.value_changed.connect (() => {
                settings.set_int("weather-id", weatherIdEntry.get_value_as_int ());
            });

		    this.container.attach(weatherIdEntry, 1, 0, 1, 1);

            // ID HELP MESSAGE
            var weatherIdHelp = new Gtk.Label ("<span font_desc=\"8.0\">*" + _("Example: If the URL is <i>http://weather.yahoo.com/united-kingdom/england/london-44418/</i> the city's ID is 44418.") + "</span>");
		    weatherIdHelp.set_use_markup (true);
		    weatherIdHelp.set_line_wrap (true);
		    this.container.attach(weatherIdHelp, 1, 1, 2, 1); 
            weatherIdHelp.set_alignment (0, 0);

            
            // UNIT ENTRY
            var weatherUnitBox = new Gtk.ComboBoxText ();
            string new_unit = "";
            
		    weatherUnitBox.append_text ("Celsius");
		    weatherUnitBox.append_text ("Fahrenheit");

            if (this.weather_unit == "'Celsius'")
		        weatherUnitBox.active = 1;
            else
                weatherUnitBox.active = 0;
		    this.container.attach(weatherUnitBox, 2, 0, 1, 1);

            weatherUnitBox.changed.connect (() => {

                    if (weatherUnitBox.get_active_text() == "Celsius"){
                        new_unit = "Celsius";
                    }
                    else{
                        new_unit = "Fahrenheit";
                    }
                    settings.set_string("weather-unit", new_unit);
            });

           // UNIT LABEL [F/C]
            var weatherUnitLabel = new Gtk.Label ( "<a href='http://weather.yahoo.com'>" + _("Search Location ID on Yahoo!® Weather") + "</a> :");
		    this.container.attach(weatherUnitLabel, 0, 1, 1, 1);
            weatherUnitLabel.set_alignment (1, 0);
            weatherUnitLabel.set_use_markup (true);
		    weatherUnitLabel.set_line_wrap (true);

            // RESET BUTTON
            var resetButton = new Gtk.Button.with_label ( _("Reset") );
		    this.container.attach(resetButton, 2, 2, 1, 1);
            resetButton.clicked.connect(() => {
                settings.reset("weather-unit");
                settings.reset("weather-id");
                weather_id = settings.get_int("weather-id");
                weather_unit = settings.get_string("weather-unit");
                weatherIdEntry.set_value (this.weather_id);
                if (this.weather_unit == "'Celsius'")
                    weatherUnitBox.active = 1;
                else
                    weatherUnitBox.active = 0;
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
