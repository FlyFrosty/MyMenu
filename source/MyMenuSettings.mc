import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

//This is for on-watch menu
class MyMenuSettings {

    function initialize() {
        menuSelector = Application.Storage.getValue("mySelection"); //See if a selection was already made
        
        if(menuSelector==null) {menuSelector=false;}
    }
}


class MyMenuSettingsMenu extends WatchUi.Menu2 {

    function initialize() {
        
        Menu2.initialize(null);
        Menu2.setTitle("Color");
        Menu2.addItem(new WatchUi.MenuItem("Red", null, "red", null));
        Menu2.addItem(new WatchUi.MenuItem("Blue", null, "blue", null));
    }

}

class MyMenuSettingsMenuDelegate extends WatchUi.Menu2InputDelegate {

    var classView;

    function initialize(topView) {
        Menu2InputDelegate.initialize();
        classView = topView;
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        if (id.equals("red")) {
            System.println("Settings line 53");
            menuSelector= true;
            onBack();
        } else {
            System.println("Settings line 56");
            menuSelector = false;
            onBack();
        }
    }

    function onBack() as Void {

        Application.Storage.setValue("mySelection",menuSelector);
        System.println("Settings line 65");
        WatchUi.popView(WatchUi.SLIDE_BLINK);
    }
}
