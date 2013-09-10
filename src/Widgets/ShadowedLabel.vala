// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/***
    BEGIN LICENSE

    Copyright (C) 2013 Tom Beckmann

    This program is free software: you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License version 3, as published
    by the Free Software Foundation.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranties of
    MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
    PURPOSE.  See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program.  If not, see <http://www.gnu.org/licenses/>

    END LICENSE
***/

using Clutter;

public class ShadowedLabel : Actor {
    Granite.Drawing.BufferSurface buffer;

    string _label = "";
    public string label {
        get {
            return _label;
        } set {
            if (value == _label)
                return;

            _label = value;

            var l = new Pango.Layout (Pango.cairo_font_map_get_default ().create_context ());
            l.set_markup (label, -1);
            Pango.Rectangle ink, log;
            l.get_extents (out ink, out log);
            width = (log.width / Pango.SCALE + 20);
            height = (log.height / Pango.SCALE) + 6;
        }
    }

    public ShadowedLabel (string _label) {
        content = new Canvas ();
        (content as Canvas).draw.connect (draw);

        notify["width"].connect (() => {(content as Canvas).set_size ((int) width, (int) height); });
        notify["height"].connect (() => {(content as Canvas).set_size ((int) width, (int) height); });

        label = _label;
    }

    bool draw (Cairo.Context cr) {
        cr.set_operator (Cairo.Operator.CLEAR);
        cr.paint ();
        cr.set_operator (Cairo.Operator.OVER);

        buffer = new Granite.Drawing.BufferSurface ((int) width, (int) height);
        var layout = Pango.cairo_create_layout (buffer.context);
        layout.set_markup (label, -1);

        buffer.context.move_to (0, 1);
        buffer.context.set_source_rgba (0, 0, 0, 1);
        Pango.cairo_show_layout (buffer.context, layout);
        buffer.exponential_blur (3);

        buffer.context.move_to (0, 0);
        buffer.context.set_source_rgba (1, 1, 1, 1);
        Pango.cairo_show_layout (buffer.context, layout);

        cr.set_source_surface (buffer.surface, 0, 0);
        cr.paint ();

        return true;
    }
}

