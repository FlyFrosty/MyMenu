import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class myMenuView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.clear();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var wWidth, wHeight;
        var clockTime = System.getClockTime();
        var timeString;


        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLACK);
        dc.clear();

        if (leadZero) {
            timeString = Lang.format("$1$:$2$", [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]);
        } else {
            var hours = clockTime.hour;
            if (hours > 12) {
                hours = hours - 12;
            }
            timeString = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        }

        wWidth = dc.getWidth();
        wHeight = dc.getHeight();
        dc.drawText((wWidth / 2), (wHeight * 0.22), Graphics.FONT_NUMBER_THAI_HOT, timeString, Graphics.TEXT_JUSTIFY_CENTER);

    }

}
