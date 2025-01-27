# ModdakirSDK
 Framework as a Swift package for Integrating with Moddakir Services, it connects you Directly with on of our distinct teachers in order to share the learning of the Holy Qur’an 📖

## Getting Started
These instructions will help you setup, integrate and run your project integrated with our SDK.

### Prerequisits
- ```Xcode (version 12.0 or newer)```
- ```iOS (version 13.0 or newer)```

### Integration (SPM)
To install ModdakirSDK, follow these steps:

1. Open your Xcode project.
2. Go to File > Swift Packages > Add Package Dependency.
3. Paste the following URL of this repository:
   
    ```bash
    https://github.com/Moddakir-App/ModdakirSDK

5. Make sure to add ModdakirSDK Product to your target.
6. Add Moddakir_ID and Moddakir_Key Provided by Moddakir team into info.plist
7. Add Voice over IP Capapility to your app in order to allow CallKit Screen to manage the call


<br>


## Quick Start
  In order to Initialize ModdakirSDK, you're required to provide user details, and the root view controller in addition to themeMode and    primaryColor

  
```swift
import ModdakirSDK
/*
 * rest of code
 *
 */

let name = "name"
let gender: ModdakirGender = .male
let email = "moddakir@gmail.com"
let color = UiColor.red
let themeMode: ModdakirThemeManager.ThemeMode = .dark

ModdakirService.initiateCall(
      userInfo: .init(
          fullName: name,
          gender: gender,
          email: email
      ),
      rootView: self,
      primaryColor: color,
      themeMode: themeMode
)
```

assign yourself as a delegate of ModdakirSDK in order to get notified when something happened

```swift
ModdakirService.delegate = self
```

and then conform to the delegate

```swift
extension YourClass: ModdakirServiceDelegate {
    func failedToInitiateCall(withError error: String, andType type: ModdakirService.InitiateCallError) {
        
        switch type {
            case .noInternet:
                 do_something
            case .notValidEmail:
                do_something
            case .emptyName:
                do_something
            case .unauthorized:
               check_info.plist
        }
    }
}
```





