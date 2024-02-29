# Events Dicovery

## Description
This project will show a list of events where you can also search for a specific one.

## Topics
* [Architecture](#architecture)
* [Concepts covered](#conceptscovered)
* [In this version](#inthisversion)
* [Future items](#futureitems)
* [Dependencies](#dependencies)
* [Requirements](#requirements)

## Architecture
For this application we used **MVVM-C** where C stands for Coordinator to manage all the presentations for each flow.
Using this pattern also allow us to manage all the business logic inside the ViewModels, given a good point when we're looking at an application with Scalability, Readability and Maintainability.
Following the same concept we created a components that could be used everywhere.
* MVVM-C(Coordinator).
* asyn & await.
* Combine.
* SwiftUI.
* Cache for images.

## Concepts covered
* SOLID.
* Inheritance.
* Encapsulation.
* Maintainability.
* Scalability.
* Readability.
* Testability.
* Components.

## In this version

#### Screens
* Spalsh screen.
* List of events.
* Search events.

#### Components
* Error.
* Empty.
* Loader.

#### Other things
* App icon.
* Unit tests.
* Internationalization(*English only*).

## Future items
* Create custom frameworks/modules for each component to allow to grow scalable in a different teams
* UI tests, tesing screens and the elements in itself.
* Support both Dark and Light mode.
* Add Crashlytics to traking all issues.

## Dependencies
* [Alamofire](https://github.com/Alamofire/Alamofire) 5.8.1

## Requirements
* iOS 16.0+.
* Xcode 15.2.
* Swift 5.0.
