#UIScrollView-Autolayout

UIScrollView主要是ContentSize的设置。我这里的container的四边和scrollview的间距为0，然后设置了container的宽高，变相的设置的UIScrollView的ContentSize为container的宽高。

另外scrollview的上面有高度为64的间隙，代码的解决办法如下。
```
if #available(iOS 11.0, *) {
  scrollView.contentInsetAdjustmentBehavior = .never
} else {
  automaticallyAdjustsScrollViewInsets = false
}
```
storyboard需要去掉勾选ViewController的Adjust Scroll View Insets