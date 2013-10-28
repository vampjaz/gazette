gazette
=======

A fork of the gazette newsreader for elementaryOS

Forked from https://launchpad.net/gazette

This branch has a black color scheme in stead of a white one.

How to compile:
===============

In the terminal, navigate to your desired folder (anywhere you have write access), then:

    # install dependencies  
    sudo apt-get install git cmake valac libclutter-1.0-dev libclutter-gtk-1.0-dev libzeitgeist-dev libgoa-1.0-dev libgoa-1.0-0 libsoup2.4-dev libgdata-dev
    # get the code
    git clone https://github.com/red-green/gazette.git -b Color-schemes
    cd gazette
    # then compile and install:
    cmake ./
    make
    sudo make install

**Changing colors**

To change the text color, open src/Gazette.vala in a text editor. The third line should say:

    constant string textcolor = "whatever color you want the text to be";

The color can be a common name (blue, red, black) or any HTML allowed color. To set the color:

    # if gazette is running, kill it:
    killall gazette

    # now recompile and reinstall
    cmake ./ && make && sudo make install

    # now relaunch in the background:
    gazette &
