# ButtonBackgroundColor-iOS

##   What is it?

Category to handle the background color of a UIButton in normal and selected state.

Helps on the size of the app, avoiding to add images to handle states.

As you know iOS only allows you to set the background color of a button for ```objcUIControlStateNormal```. If you want different colors for different states, like ```objcUIControlStateSelected```, you should use ```objcsetBackgroundImage: forState:```.

But this comes with a price, for every button in our app we will need an image for every state. With this category you can set the background color of a button for either ```objcUIControlStateNormal``` or ```objcUIControlStateSelected```.

## Installation

#### Podfile

```ruby
platform :ios, '8.0'
pod 'ButtonBackgroundColor', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

#### Old school

Drag into your project the folder `/ButtonBackgroundColor-iOS`. That's all.

## Example

```objc
#import "UIButton+BBCBackgroundColor.h"

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
                   backgroundColorSelected:[UIColor blueColor]];
    }
    
    return _button;
}
```

## License

Please see the file called LICENSE.

## Versions

git tag -a 1.0.0 -m 'Version 1.0.0'

git push --tags

## Contact

Gabriel Massana gabrielmassana@gmail.com

## Author

Gabriel Massana

##Found an issue?

Please open a [new Issue here](https://github.com/GabrielMassana/ButtonBackgroundColor-iOS/issues/new) if you run into a problem specific to ButtonBackgroundColor-iOS, have a feature request, or want to share a comment.


