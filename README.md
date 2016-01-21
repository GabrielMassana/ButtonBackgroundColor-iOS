# ButtonBackgroundColor-iOS

Category to handle the background color of a UIButton in normal and selected state.
Helps on the size of the app, avoiding to add images to handle states.

# How to Install it

### Podfile

```ruby
platform :ios, '8.0'
pod 'ButtonBackgroundColor', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Old school

Drag into your project the folder `/ButtonBackgroundColor-iOS`. That's all.


# Example

```objc

#import "UIButton+BBCBackgroundColor.h"

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
}```

# Versions

git tag -a 1.0.0 -m 'Version 1.0.0'

git push --tags