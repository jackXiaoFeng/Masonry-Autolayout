# Masonry-Autolayout

Masonry介绍与使用实践：快速上手Autolayout

http://www.cocoachina.com/ios/20141219/10702.html

前
1
	
MagicNumber -> autoresizingMask -> autolayout

以上是纯手写代码所经历的关于页面布局的三个时期

在iphone1-iphone3gs时代 window的size固定为(320,480) 我们只需要简单计算一下相对位置就好了

在iphone4-iphone4s时代 苹果推出了retina屏 但是给了码农们非常大的福利:window的size不变

在iphone5-iphone5s时代 window的size变了(320,568) 这时autoresizingMask派上了用场(为啥这时候不用Autolayout? 因为还要支持ios5呗) 简单的适配一下即可

在iphone6+时代 window的width也发生了变化(相对5和5s的屏幕比例没有变化) 终于是时候抛弃autoresizingMask改用autolayout了(不用支持ios5了 相对于屏幕适配的多样性来说autoresizingMask也已经过时了)

那如何快速的上手autolayout呢? 说实话 当年ios6推出的同时新增了autolayout的特性 我看了一下官方文档和demo 就立马抛弃到一边了 因为实在过于的繁琐和啰嗦(有过经验的朋友肯定有同感)

直到iPhone6发布之后 我知道使用autolayout势在必行了 这时想起了以前在浏览Github看到过的一个第三方库Masonry 在花了几个小时的研究使用后 我就将autolayout掌握了(重点是我并没有学习任何的官方文档或者其他的关于autolayout的知识) 这就是我为什么要写下这篇文章来推荐它的原因.
