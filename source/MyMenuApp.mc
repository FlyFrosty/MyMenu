import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class MyMenuApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }


    // Return the initial views of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new MyMenuView();
        
        return [view, new MyMenuDelegate()]; //The basic view
    }

    function getSettingsView() as [Views] or [Views, InputDelegates] or Null {
        var menu = new MyMenuSettingsMenu();

        return [menu, new MyMenuSettingsMenuDelegate(menu)];  //The menu view
    }

}

function getApp() as MyMenuApp {
    return Application.getApp() as MyMenuApp;
}

