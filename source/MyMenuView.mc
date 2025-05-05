import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

    var menuSelector;  //The boolean returned by the toggleMenu 

class MyMenuView extends WatchUi.WatchFace {

    var wWidth=200;
    var wHeight=200;

    function initialize() {
        WatchFace.initialize();
        menuSelector = Application.Storage.getValue("mySelection"); //See if a selection already exists
        if(menuSelector==null) {menuSelector=false;}  //If not, assign a default
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        
        wHeight = dc.getHeight();       //screen size
        wWidth = dc.getWidth();
    }


    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        //Assign color based on menu selection
        if (menuSelector) {
            System.println("View line 36");
            dc.setColor(Graphics.COLOR_DK_RED, Graphics.COLOR_TRANSPARENT);
        } else {
            System.println("View line 39");
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        }
        dc.drawText(wWidth/2,wHeight/2,Graphics.FONT_LARGE,timeString,Graphics.TEXT_JUSTIFY_CENTER);

    }

    function getSettingsView() as [Views] or [Views, InputDelegates] or Null {
        var menu = new MyMenuSettingsMenu();
        return [menu, new MyMenuSettingsMenuDelegate(menu)];        //Makes menu available to view
    }

}

class MyMenuDelegate extends WatchUi.WatchFaceDelegate {
	
	function initialize() {
		WatchFaceDelegate.initialize();
    }
}