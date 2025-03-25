import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;


var leadZero = false;


class myMenuApp extends Application.AppBase {

    var view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        view = new myMenuView();
        return [new myMenuView() ];
        //            return [view,new ComplexWFDeligate(view)];
    }


}

function getApp() as myMenuApp {
    return Application.getApp() as myMenuApp;
}

