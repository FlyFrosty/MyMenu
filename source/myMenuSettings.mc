import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;


class myMenuSettings {

    var leadZero=false;

    function initialize() {
        loadLocal();    //on-device settings
    }


    // load local settings. from Application.Storage
    function loadLocal() {
        leadZero=Application.Storage.getValue("leadzero");
        if(leadZero==null) {leadZero=false;}
    }

    //save changes to on device setting
    function saveLocal() {
        Application.Storage.setValue("leadzero",leadZero);
    }

}

class myMenuSettingsMenu extends WatchUi.Menu2 {
    var mySettings=null;

    function initialize() {
        Menu2.initialize(null);
        mySettings=new myMenuSettings();
        Menu2.setTitle("Settings");

 		Menu2.addItem(new WatchUi.ToggleMenuItem("Leading Zero for Hours", null,"lz",mySettings.leadZero, null));
    }
}

class myMenuMenuDelegate extends WatchUi.Menu2InputDelegate {
	var view=null;

    function initialize(v) {
        Menu2InputDelegate.initialize();
        view=v;
    }
    
  	function onSelect(item) {
  		var id=item.getId();
  		if(id.equals("lz"))   {
            view.mySettings.leadZero=!view.mySettings.leadZero;
        }   	
	}
    
    function onBack() {
        view.mySettings.saveLocal();
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		//return false;
    }

}	
