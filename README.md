gazette
=======

A fork of the gazette newsreader for elementaryOS

Forked from https://launchpad.net/gazette

This branch has a default black color scheme in stead of a white one.

How to compile:
===============

In the terminal, navigate to your desired folder (anywhere you have write access, try typing `cd ~`), then type or copy this and run in the terminal:

    # install dependencies  
    sudo apt-get install git cmake valac libclutter-1.0-dev libclutter-gtk-1.0-dev libzeitgeist-dev libgoa-1.0-dev libgoa-1.0-0 libsoup2.4-dev libgdata-dev libpantheon-dev libgranite-dev libgtk-3-0

    # get the code
    git clone https://github.com/red-green/gazette.git -b Color-schemes
    cd gazette
    # then compile and install:
    cmake ./
    make
    sudo make install

**Changing colors**

To change the text color, open whatever-folder-gazette-was-downloaded-in/gazette/src/Gazette.vala in a text editor. The third line should say:

    const string textcolor = "whatever color you want the text to be";
Then save the file.
The color can be a common name (blue, red, black, etc...) or any HTML allowed color. To set the color once it has been changed, run these commands in the terminal:

    # if gazette is running, kill it:
    killall gazette

    # now recompile and reinstall (do this in the gazette folder you downloaded):
    cmake ./ && make && sudo make install

    # now relaunch in the background:
    gazette &
