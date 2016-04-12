# ButtonBackgroundColor-iOS

[![Version](https://img.shields.io/cocoapods/v/ButtonBackgroundColor.svg?style=flat-square)](http://cocoapods.org/pods/ButtonBackgroundColor)
[![License](https://img.shields.io/cocoapods/l/ButtonBackgroundColor.svg?style=flat-square)](http://cocoapods.org/pods/ButtonBackgroundColor)
[![Platform](https://img.shields.io/cocoapods/p/ButtonBackgroundColor.svg?style=flat-square)](http://cocoapods.org/pods/ButtonBackgroundColor)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/ButtonBackgroundColor.svg?style=flat-square)](http://cocoapods.org/pods/ButtonBackgroundColor)
[![Build Status](https://img.shields.io/travis/GabrielMassana/ButtonBackgroundColor-iOS/master.svg?style=flat-square)](https://travis-ci.org/GabrielMassana/ButtonBackgroundColor-iOS)

##   What is it?

Category to handle the background color of a UIButton in normal and highlighted state.

Helps on the size of the app, avoiding to add images to handle states.

As you know iOS only allows you to set the background color of a button for``` UIControlStateNormal```. If you want different colors for different states, like``` UIControlStateHighlighted```, you should use``` setBackgroundImage: forState:```.

But this comes with a price, for every button in our app we will need an image for every state. With this category you can set the background color of a button for either``` UIControlStateNormal``` or``` UIControlStateHighlighted```.

## Installation

#### Podfile

```ruby
platform :ios, '8.0'
pod 'ButtonBackgroundColor'
```

Then, run the following command:

```bash
$ pod install
```

#### Old school

Drag into your project the folder `/ButtonBackgroundColor-iOS`. That's all.

## Example Swift

```swift

 let button: UIButton = UIButton(type: .Custom)
 button.backgroundColorForStates(normal: UIColor.redColor(), highlighted: UIColor.blueColor())
```

## Example Objective-C

```objc
#import "ButtonBackgroundColor-Swift.h"

...

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0.0f,
                                   100.0f,
                                   CGRectGetWidth([UIScreen mainScreen].bounds),
                                   80.0f);
        
        [_button bbc_backgroundColorNormal:[UIColor redColor]
                backgroundColorHighlighted:[UIColor blueColor]];
    }
    
    return _button;
}
```



## License

ButtonBackgroundColor-iOS is released under the MIT license. Please see the file called LICENSE.

## Versions

```bash
$ git tag -a 2.0.0 -m 'Version 2.0.0'

$ git push --tags
```

## Author

Gabriel Massana

##Found an issue?

Please open a [new Issue here](https://github.com/GabrielMassana/ButtonBackgroundColor-iOS/issues/new) if you run into a problem specific to ButtonBackgroundColor-iOS, have a feature request, or want to share a comment.


