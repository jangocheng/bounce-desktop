package main

import (
	"gopkg.in/qml.v1"
	//"time"
	//"fmt"
)

type Theme struct {
	Name			string
	FontFamily		string
	MainColor		string
	Opacity			float64
	FontColorPrimary	string
	FontColorAccent		string
	AccentItalics		bool
	HoverColor		string
	TitleImage		string
	NewIdentityIcon		string
	AddDeviceIcon		string
	ResumeDeviceIcon	string
}

func publishTheme(engine *qml.Engine) {
	// check database for theme

	terminal_theme := Theme {
		Name:			"Terminal",
		FontFamily:		"Tahoma",
		MainColor:		"#000000",
		Opacity:		0.9,
		FontColorPrimary:	"#FFFFFF",
		FontColorAccent:	"#DDDDDD",
		AccentItalics:		true,
		HoverColor:		"#505050",
	}

	default_theme := Theme {
		Name:			"Default",
		FontFamily:		"Tahoma",
		MainColor:		"#E0C2B2",
		Opacity:		1.0,
		FontColorPrimary:	"#000000",
		FontColorAccent:	"#525252",
		AccentItalics:		false,
		HoverColor:		"#DDDDDD",
	}

	//themes := make([]Theme, 0)	// publish a slice of themes to choose from

	//fmt.Println(engine.LoadFile("qrc:///images/bounce.png"))

	engine.Context().SetVar("theme", default_theme)
	engine.Context().SetVar("terminal_theme", terminal_theme)
	//go func() {
	//	time.Sleep(5 * time.Second)
	//	context.SetVar("theme", terminal_theme)
	//}()
}
