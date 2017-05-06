# PPKeyboardActor
#### 非常轻量级的键盘遮挡输入框解决方案

* 支持UITableViewCell及UICollectionViewCell上的输入控件

1.   该工具保持一贯的轻量级与简洁，没有任何冗余的代码，只为解决项目中经常遇到的键盘弹出挡住所使用的输入框的问题
2. 使用十分简单，方式如下:

```
// actorView: 需要移动的view，常见是当前控制器的view
// 在初始化代码里写上这段
    self.actor = [PPKeyboardActor keyboadWithActorView:self.view];

 ```
 使用时请将 PPKeyboardActor 实例定义为强引用，以防被销毁.
 
  ![Aaron Swartz](https://github.com/JungHsu/PPKeyboardActor/blob/master/PPKeyboardActor1.gif)
 
 > 如果在使用的时候出现问题与BUG，希望能及时反应，谢谢！
