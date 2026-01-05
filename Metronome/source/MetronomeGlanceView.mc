import Toybox.Application;
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class MetronomeGlanceView extends WatchUi.GlanceView {

    function initialize() {
        GlanceView.initialize();
    }

    function onUpdate(dc) {
        var text = "BPM: " + Storage.getValue("bpm").toString();
        dc.setColor(0xffffff, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/2, Graphics.FONT_SMALL, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // This is what lets the user open the app
    function onSelect() {
        var app = getApp();
        app.userStarted = true;

        WatchUi.pushView(
            new MetronomeView(),
            new MetronomeDelegate(),
            WatchUi.SLIDE_UP
        );
        return true;
    }
}
