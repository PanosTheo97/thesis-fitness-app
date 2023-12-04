# thesis-fitness-app
A repo containing the iOS project for my thesis fitness app

## Getting Started

### Installing

This project uses cocoapods to install various pods. To run the project:
* Clone the repo
* Open a terminal window @ the project folder
* Run the following
```
pod install
``` 
After that you should be good to go. If you dont have cocoapods initialized in your mac, visit <https://guides.cocoapods.org/using/getting-started.html> for more information regarding cocoapods installation.

## Description

### Project Design Pattern

Thesis Fitness App is written following the **MVVM** Design Patern principles. In this specific integration I use the following layers:

* **View** - Responsible for UI updates as well as user interaction events propagation to **ViewModel**.
* **ViewModel** - Responsible for Data storing/manipulation as well as providing data to the **View** layer.
* **FlowCoordinator** - Responsible for moving from one controller to the next. All flow events are handled by the **FlowCoordinator** layer.
* **DIContainer** - Used to store modules of other scenes that are needed by the **FlowCoordinator**.
* **Module** - Responsible for constructing and initializing all of the above layers.

Another commonly used pattern is the **Delegation** pattern, which is used to pass events from scene to scene.

### Pods

Thesis Fitness App uses a number of pods to simplify the development procedure. These are pods that I am familiar with and have used widely in my day to day development workflows. \
Some major pods used are the following:

* **Alamofire** - Handles data requests and Networking.
* **ObjectMapper** and **SwiftyJson** - Used for JSON mapping.
* **Kingfisher** - Handles Image fetching and caching.
* **SwiftyUserDefaults** - Handles storing and getting data from the User Defaults.
* **SVProgressHud** - An easy to use loader.
* **SwiftLint** - Helps keep track of code formatting.

## Epilogue

For any questions feel free to contect me on my LinkedIn or my Email Address

* Email - <ptheodos97@outlook.com>
* LinkedIn - <https://www.linkedin.com/in/panagiotis-theodosiadis-367005192/>

