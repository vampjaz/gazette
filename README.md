Gazette
=======

A fork of the gazette newsreader for elementaryOS

Forked from https://launchpad.net/gazette

**Differences from the [https://launchpad.net/gazette](original version)**

* Added ability to change the font color
* Added app launcher

**To do still (please help!)**

* Make it easier to change color and launcher apps with GUI settings manager
* Fix calendar (it came with the code, but was never implemented, apparently due to bugs)


How to compile:
===============

In the terminal, navigate to your desired folder (anywhere you have write access), then:

    # install dependencies  
    sudo apt-get install git cmake valac libclutter-1.0-dev libclutter-gtk-1.0-dev libzeitgeist-dev libgoa-1.0-dev libgoa-1.0-0 libsoup2.4-dev libgdata-dev libpantheon-dev libgranite-dev libgtk-3-0
    # get the code
    git clone https://github.com/red-green/gazette.git
    cd gazette
    # then compile and install:
    cmake ./
    make
    sudo make install

Then, to make it start when you log in:

* Go to settings, click on startup applications
* Click add, enter `Gazette` in Name and `gazette` in Command
* Click Add. your gazette is now configured!

Changing things:
================

**Text color**

In the file `src/Gazette.vala`, the 3rd line says

    const string textcolor = "black";

You can change the color to whatever you like, either a standard color name or an HTML color.
Make any necessary changes, then recompile.

**Apps**

In the file `src/Services/Launcher.vala`, the first few lines say

    const string apps_string = "Chrome\nFiles\nTerminal\nText Editor\nProcessing\nPython\nArduino";
    const string[] apps_term = {"chromium-browser","pantheon-files","x-terminal-emulator","gedit","/home/jackson/Programming/processing-2.0.3/processing","idle","/home/jackson/Programming/arduino-1.0.5/arduino"};

The string `apps_string`contains the display names of the apps seperated by `\n`s. The string `apps_term` is a list of the commands to run in the terminal to activate these apps.
Make any necessary changes, then recompile.

**Recompiling**

Once your changes are made, `cd` to the main `gazette` directory, then simply type or copy/paste the following in the terminal:

    killall gazette
    make
    sudo make install
    gazette &
