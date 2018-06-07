# SBAActionSheetPicker
===================================
Easy to use  customised action sheet picker inspired by UIAlertController

![CocoaPods](https://cocoapod-badges.herokuapp.com/v/SBAActionSheetPicker/badge.png)

<a href="https://imgflip.com/gif/2bs8md"><img src="https://i.imgflip.com/2bs8md.gif" title="made at imgflip.com"/></a>

Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'SBAActionSheetPicker'
```
Usage
-----
Create `SBAActionSheetPicker` controller

```swift
let actionSheetPicker = SBAActionSheetPicker.create(.white) as SBAActionSheetPicker
```

Create `SBAAction` actions

```swift
let action1 = SBAAction.init(title: "Accessibility", image: UIImage.init(named: "accessibility"),color: .black) { (action) in
print("Accessibility")
}

let action2 = SBAAction.init(title: "Acount Balance", image: UIImage.init(named: "account_balance"),color: .black) { (action) in
print("Acount Balance")
}

let action3 = SBAAction.init(title: "Close", image: UIImage.init(named: "close"),color: .black) { (action) in
print("Close")
}
```
Set `SBAAction` actions array to  `SBAActionSheetPicker`  and prensent it

```swift
actionSheetPicker.addActions(actions: [action1,action2,action3])
self.present(actionSheetPicker, animated: false, completion: nil)
```
Congratulations! You're done.

License
-------

SBAActionSheetPicker is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
