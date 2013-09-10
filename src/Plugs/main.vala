using Gtk;
using Pantheon;

public class GazetteSettings : Pantheon.Switchboard.Plug {

    GLib.List<Gazette.Service> services;
    Gazette.Service current;
   
    public GazetteSettings(){
        
        this.services = new GLib.List<Gazette.Service> ();
        services.append (new Gazette.Weather  ());
        services.append (new Gazette.RecentFiles  ());
        services.append (new Gazette.RSS  ());
        
        var box  = new Gtk.Box   (Gtk.Orientation.HORIZONTAL, 0);
        var list = new Gtk.Box   (Gtk.Orientation.VERTICAL, 0);
        var view = new Gtk.Box   (Gtk.Orientation.VERTICAL, 0);
        var scrl = new Gtk.ScrolledWindow (null, null);
        
        scrl.add_with_viewport (list);
        scrl.width_request = 300;
        list.margin = 12;
        
        box.pack_start (scrl, false);
        box.pack_start (view);
        var cur_box   = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 20);
        var cur_label = new Gtk.Label ( _("Setup your\nnews services") );
        var cur_image = new Gtk.Image.from_icon_name (
            "gazette", Gtk.IconSize.DIALOG);
        cur_image.pixel_size = 64;
       
        var attrs = new Pango.AttrList ();
        attrs.insert (new Pango.AttrFontDesc (
            Pango.FontDescription.from_string ("bold 25")));
        cur_label.set_attributes (attrs);
        
        cur_label.halign = Gtk.Align.START;
        cur_box.pack_start (cur_image, false);
        cur_box.pack_start (cur_label);
        
        view.pack_start (cur_box, false);
        view.margin = 30;
           

/*        var button = new Gtk.Button.with_label("Oh Herro");            
        
        button.clicked.connect(() => {
            button.label = "Goodbye =(";
        });
        
        this.add(button);*/


            for (var i=0;i<services.length ();i++) {
                services.nth_data (i).activated.connect ( (s) => {
                    if (this.current != null) {
                        this.current.item.get_style_context ().remove_class (Gtk.STYLE_CLASS_BUTTON);
                        view.remove (this.current.container);
                    }
                    this.current = s;
                    s.item.get_style_context ().add_class (Gtk.STYLE_CLASS_BUTTON);
                    s.item.get_style_context ().set_state (Gtk.StateFlags.ACTIVE);
                    s.item.get_style_context ().invalidate ();
                    view.add (s.container);
                    view.show_all ();
                    cur_label.label = s.name.label;
                    cur_image.icon_name = s.icon.icon_name;
                });
                list.pack_start (services.nth_data (i).item, false);
            }



        this.add (box);
    }
}

public static int main(string[] args){

    Gtk.init(ref args);
    
    var SwitchBoard_Plug = new GazetteSettings();
    SwitchBoard_Plug.register(_("Column News"));
    SwitchBoard_Plug.show_all();
    Gtk.main();
	return 0;
}
