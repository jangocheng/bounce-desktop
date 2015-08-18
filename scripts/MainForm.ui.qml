import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.0

Item {
	property int naturalWidth:	480		// as a fraction of the desktop width/height?
	
	// Load text from BounceTranslation
	property string newIdentityString:		"New Identity"									// BounceTranslation.NewInstall.NewIdentityString
	property string newIdentitySubText:		"this is my first time using bounce"			// BounceTranslation.NewInstall.NewIdentitySubText
	property string addDeviceString:		"Add Device"									// BounceTranslation.NewInstall.AddDeviceString
	property string addDeviceSubText:		"I have already installed bouce"				// BounceTranslation.NewInstall.AddDeviceSubText
	property string resumeDeviceString:		"Resume Device"									// BounceTranslation.NewInstall.ResumeDeviceString
	property string resumeDeviceSubText:	"I am resuming a transferred device"			// BounceTranslation.NewInstall.ResumeDeviceSubText
	
	// Load theme from BounceTheme
	property string fontFamily:			"Tahoma"
	property string backgroundColor:	"#000000"
	property string mainFontColor:		"#FFFFFF"
	property string subTextColor:		"#DDDDDD"//"#525252"
	property string mouseoverColor:		"#505050"
	property string bounceImageColor:	"#888888"//"transparent"	// remove?  replace image with theme instead.  define images in JSON?
	property bool italicSubtext:		true
	
	property string bounceImageSource:			""				// BounceTheme.NewInstall.BounceImageSource
	property string newIdentityImageSource:		""
	property string addDeviceImageSource:		""
	property string resumeDeviceImageSource:	""

	// determine is desktop view or mobile view should be used based on window size
	function useDesktopView() {
		var minDesktopHeight = naturalWidth * 0.25 * 4.5	// dont worry about it
		if (mainWindow.width > naturalWidth && mainWindow.height > minDesktopHeight) {
			return true
		}
		return false
	}

	function getMainWidth() {
		return useDesktopView() ? naturalWidth : mainWindow.minimumWidth
	}

	function getMainHeight() {
		return getMainWidth() * 0.25
	}

	function getYFromIndex(n) {
		var y = n*getMainHeight()-2*getMainHeight()
		if (n == 0) {
			y -= 0.4*getMainHeight()
		}
		y += getMainHeight() * 0.25
		return y
	}
	
	function getMainFontSize() {
		return getMainHeight() * 0.35
	}
	
	function getSubFontSize() {
		return getMainHeight() * 0.15
	}

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
    }
    
    property alias newIdentityButton: newIdentityButton

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

		Rectangle {
			color: bounceImageColor
            x: 0-width/2
            y: getYFromIndex(0)
            height: getMainHeight() * 1.1
            width: getMainWidth()
		}

        Image {
			id: bounceImage
            source: "qrc:///../images/bounce.png"
            x: 0-width/2
            y: getYFromIndex(0)
            height: getMainHeight() * 1.1
            fillMode: Image.PreserveAspectFit
        }


		// better to use a list view here?  probably.
        Rectangle {
            x: 0-width/2
            y: getYFromIndex(1)
            width: getMainWidth()
            height: getMainHeight()
            color: newIdentityButton.containsMouse ? mouseoverColor : "transparent"

            MouseArea {
               id: newIdentityButton
               anchors.fill: parent
               hoverEnabled: true
           }

            Text {
                text: qsTr(newIdentityString)
                font.family: fontFamily
                color: mainFontColor
                x: getMainWidth() * 0.01
                y: getMainHeight() * 0.1
                width: getMainWidth()-getMainHeight()
                height: getMainFontSize()
                font.pixelSize: getMainFontSize()
            }

            Text {
                text: qsTr(newIdentitySubText)
                font.family: fontFamily
                font.italic: true
                color: subTextColor
                x: getMainWidth() * 0.02
                y: getMainHeight() * 0.65
                width: getMainWidth() - getMainHeight()
                height: getSubFontSize()
                font.pixelSize: getSubFontSize()
            }

            Image {
                source: "qrc:///../images/newcontact.png"
                x: getMainWidth()-getMainHeight()
                width: getMainHeight()
                height: getMainHeight()
                sourceSize.height: naturalWidth * 0.25
                sourceSize.width: naturalWidth * 0.25
            }
        }

        Rectangle {
            x: 0-width/2
            y: getYFromIndex(2)
            width: getMainWidth();
            height: getMainHeight();
            color: joinDevicePoolButton.containsMouse ? mouseoverColor : "transparent"

            MouseArea {
                   id: joinDevicePoolButton
                   anchors.fill: parent
                   hoverEnabled: true
           }

            Text {
                text: qsTr(addDeviceString)
                font.family: fontFamily
                color: mainFontColor
                x: getMainWidth() * 0.01
                y: getMainHeight() * 0.1
                width: getMainWidth()-getMainHeight()
                height: getMainFontSize()
                font.pixelSize: getMainFontSize()
            }

            Text {
                text: qsTr(addDeviceSubText)
                font.family: fontFamily
                font.italic: true
                color: subTextColor
                x: getMainWidth() * 0.02
                y: getMainHeight() * 0.65
                width: getMainWidth() - getMainHeight()
                height: getSubFontSize()
                font.pixelSize: getSubFontSize()
            }

            Image {
                source: "qrc:///../images/add_device.png"
                x: getMainWidth()-getMainHeight()
                width: getMainHeight()
                height: getMainHeight()
                sourceSize.height: naturalWidth * 0.25
                sourceSize.width: naturalWidth * 0.25
            }
        }

        Rectangle {
            x: 0-width/2
            y: getYFromIndex(3)
            width: getMainWidth();
            height: getMainHeight();
            color: restoreDeviceButton.containsMouse ? mouseoverColor : "transparent"

            MouseArea {
                   id: restoreDeviceButton
                   anchors.fill: parent
                   hoverEnabled: true
           }

            Text {
                text: qsTr(resumeDeviceString)
                font.family: fontFamily
                color: mainFontColor
                x: getMainWidth() * 0.01
                y: getMainHeight() * 0.1
                width: getMainWidth()-getMainHeight()
                height: getMainFontSize()
                font.pixelSize: getMainFontSize()
            }

            Text {
                text: qsTr(resumeDeviceSubText)
                font.family: fontFamily
                font.italic: true
                color: subTextColor
                x: getMainWidth() * 0.02
                y: getMainHeight() * 0.65
                width: getMainWidth() - getMainHeight()
                height: getSubFontSize()
                font.pixelSize: getSubFontSize()
            }

            Image {
                source: "qrc:///../images/restore_device.png"
                x: getMainWidth()-getMainHeight()
                width: getMainHeight()
                height: getMainHeight()
                sourceSize.height: naturalWidth * 0.25
                sourceSize.width: naturalWidth * 0.25
            }
        }

    }
}
