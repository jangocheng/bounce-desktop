package main

import (
	"fmt"
	"os"
	"gopkg.in/qml.v1"
)

// ~/.go/bin/genqrc ./images/ ./scripts/  && go run bounce.go qrc.go themes.go

func main() {
	if err := qml.Run(run); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	// if no database exists
		// create the new database
		// insert default themes
		// insert default languages

	engine := qml.NewEngine()
	component, err := engine.LoadFile("qrc:///scripts/bounce.qml")
	if err != nil {
		return err
	}
	
	//context := engine.Context()
	//context.SetVar("naturalHeight", 120)	// make a go struct known to QML
	publishTheme(engine)	
	window := component.CreateWindow(nil)

	window.Show()
	//window.show something else?
	window.Wait()
	return nil
}

