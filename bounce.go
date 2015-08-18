package main

import (
	"fmt"
	"os"

	"gopkg.in/qml.v1"
	
)

// ~/.go/bin/genqrc ./images/ ./scripts/  && go run bounce.go qrc.go 

/*
 * Main entry point for Bonce-QT
 * 
 * 
 */
func main() {
	// parse local storage for current theme, etc
	
	// kick off i2p, reseed if needed
	
	// if no database exists generate new one
	
	if err := qml.Run(run); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	engine := qml.NewEngine()
	component, err := engine.LoadFile("qrc:///scripts/bounce.qml")

	if err != nil {
		return err
	}
	
	// parse json translation struct
	
	//context := engine.Context()
	//context.SetVar("naturalHeight", 120)
	
	window := component.CreateWindow(nil)

	window.Show()
	window.Wait()

	return nil
}
