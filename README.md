

 
# PPKeyboardActor


[![Version](https://img.shields.io/cocoapods/v/PPKeyboardActor.svg?style=flat)](http://cocoapods.org/pods/PPKeyboardActor)
[![Pod License](http://img.shields.io/cocoapods/l/PPKeyboardActor.svg?style=flat)](https://opensource.org/licenses/MIT)
![](https://img.shields.io/badge/language-objc-orange.svg)

#### 非常轻量级的键盘遮挡输入框解决方案
* 支持传入一个数组实现多个代理的功能

* 支持UITableViewCell及UICollectionViewCell上的输入控件

1.   该工具保持绝对的轻量级与简洁，没有任何冗余的代码，只为解决项目中经常遇到的键盘弹出挡住所使用的输入框的问题
2. 使用十分简单，方式如下:

```
// actorView: 需要移动的view，常见是当前控制器的view
// 在初始化代码里写上这段
    self.actor = [PPKeyboardActor keyboadWithActorView:self.view];

 ```
 使用时请将 PPKeyboardActor 实例定义为强引用，以防被销毁.
 
  ![Aaron Swartz](https://github.com/JungHsu/PPKeyboardActor/blob/master/PPKeyboardActor1.gif)
 
 > 如果在使用的时候出现问题与BUG，希望能及时反应，谢谢！


## 支持CocoaPods

PPKeyboardActor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PPKeyboardActor"
```

## Author

1021057927@qq.com

## License

PPKeyboardActor is available under the MIT license. See the LICENSE file for more info.
