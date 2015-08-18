import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.1

ApplicationWindow {
	id: mainWindow
    title: qsTr("Bounce")				// translation.
    width: 1000
    height: 700
    minimumWidth: 300
    minimumHeight: 350
    x: (Screen.desktopAvailableWidth/2)-(width/2)
    y: (Screen.desktopAvailableHeight/2)-(height/2)
    visible: true
    opacity: 0.9//1.0						// BounceTheme.DefaultOpacity
    
    // main loader?
		// load with NewInstall if no db, DeviceLogin if needed, MessageBoard otherwise?
		// Also SettingsMenu, but maybe that comes on top in desktop view

    MainForm {
        anchors.fill: parent
        newIdentityButton.onClicked: messageDialog.show(qsTr("New identity"))
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("Dialog")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
