[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/igatitech/GSBaseMVC/blob/master/LICENSE) 
![Swift: 5.0.x](https://img.shields.io/badge/Swift-5.0.x-orange)

# GSBaseMVC
**GSBaseMVC is a base project which follows MVC(Model-View-Controller) coding pattern. It provides perfect base structure to start a new project with MVC Architecture.**

## What is MVC?

###### The Model-View-Controller concept describes 3 components:
- Model: a wrapper of data
- View: a representation of a user interface (UI)
- Controller: an intermediary between the Model and the View

![alt text](https://github.com/igatitech/GSBaseMVC/blob/master/Resources/MVC.png)

###### How the messages can flow from one component to the other:
- The View tells the Controller when a user interaction takes place
- The Controller updates the View when the data changes
- The Controller updates the Model when the data changes
- The Model notifies the Controller when data changes

## Why to use MVC?
- MVC is Apple’s recommended architectural pattern.
- It is an exceptionally powerful software architectural pattern for creating apps
- It keeps your code concise and readable.
- Well known architecture pattern, most developers know and understand MVC.
- It increases the modularity of your code.
- It allows for a clear separation of your application’s data/logic, views, and controllers.

## Key Features:
- Basic MVC Architecture
- Push notification Integration
- Simple TableView
- Simple CollectionView
- SJSegment Controller
- SJSegment Controller with Header
- PullToRefresh for all the listings
- Pagination in TableView


## How to run the project?

- Make sure you have an active internet connection and connected with a Physical device or you can use Xcode Simulator too.
- download or clone the project
- Open .xcworkspace file from your project folder
- Run the project from Xcode

## Coding Standards Implemented

- MVC Architecture
- Swift Language(Version: 5.1)
- Followed Apple Human User Interface Guidelines
- Used Pods for other third-party libraries
- Used Asset Catalog for Images used in the application
- App Icon and Launch Image from Asset Catalog
- Well structured code
- Use [JSON4Swift](https://www.json4swift.com/) to create models quickly & efficiently
- Proper code commenting
- Used //MARK: to mark a section of my code
- Implemented Constant file to store global constants
- Global files to increase reusability of code
- Checked Internet Connectivity
- Managed image caching for smooth user experience
- Followed double optional(??) instead of compulsory(!) pattern as and when possible to avoid unnecessary crashes
- The project contains Code Documentation same as Apple Documentation

## Ackowledgement

This project has used other third party libraries available on GitHub as mentioned below:

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
- [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [SJSegmentedScrollView](https://github.com/subinspathilettu/SJSegmentedViewController)

**Happy Coding! Cheers!!** 🥂 

## How to Contribute?

Have an idea? Found a bug? See [how to contribute](https://github.com/igatitech/GSBaseMVC/blob/master/CONTRIBUTION.md). Every small or large contribution to this project is appreciated.

## Author
You can find more about me here : [Gati Shah](https://igati.tech)

If you wish to contact me, 
Email at: [connect@igati.tech](connect@igati.tech)

Reach me on: [LinkedIn](https://www.linkedin.com/in/igatitech/)

## License
Copyright 2020 iGatiTech

This project is distributed under the terms & conditions of [MIT License](https://github.com/igatitech/GSBaseMVC/blob/master/LICENSE).
