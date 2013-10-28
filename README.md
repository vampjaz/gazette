gazette
=======

A fork of the gazette newsreader for elementaryOS

Forked from https://launchpad.net/gazette

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
