namespace Gazette {
    
    public class RecentFiles : Gazette.Service {
        
        public RecentFiles (){
            base (_("Files"), "x-office-document");
            
            this.container.attach (new Gtk.Label (_("No settings yet.")), 0, 0, 1, 1);
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
