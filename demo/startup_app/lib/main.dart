import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 此组件是应用程序的根.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这是您的应用程序的主题。
        //
        // 运行 "flutter run" 启动你的应用. 你会看到
        // 这个应用有一个蓝色的工具栏. 然后, 不要退出你的 app, 尝试
        //  "primarySwatch" 属性改变为 "Colors.green" ，之后会触发
        // "hot reload" (在运行 "flutter run" 的输出控制台长按 "r",
        // 或者在你的 Flutter IDE 中直接保存你的代码中的变更来触发 "hot reload").
        // 需要注意的是，计数器没有重置回 0; 因为这个应用根本没有退出，而是热更新。
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 这个组件是你的应用中的 hmoe 页. 它是有状态的, 意味着
  // 它有一个包含影响应用外观的属性的 State object (定义如下)。

  // 这个类是 state 的配置. 它拥有多个值 (当前情况下是 title)
  // 由它的父级提供 (当前情况下是 MyApp widget)
  // 并且由 State 类中的 build 方法提供. 在组件子类的属性用 "final" 标记。

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 次方法调用 setState 来告诉 Flutter 框架 State 中有一些状态已经改变了，
      // 这回造成重新调用 build 方法，
      // 从而在视图中能展现新的值.如果我们不使用 setState() 来改变
      // _counter, 这样不会重新调用 build 方法，
      // 所以不会发生任何事。

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用 setState 都会触发此方法调用
    //
    // Flutter 框架已经优化过了，能快速运行 build 方法，
    // 所以你可以只重建任何那些需要更新的而不是个别地改变组件地实例.
    return Scaffold(
      appBar: AppBar(
        // 这里我们从 App.build 方法创建的 MyHomePage 对象中获取值
        // 并用它来设置 appbar 的 title 属性.
        title: Text(widget.title),
      ),
      body: Center(
        // Center 是一个 layout 组件. 它接受唯一个 child 并且将它定位到 parent 居中位置。
        child: Column(
          // Column 也是一个 layout 组件. 它接受一个 children 列表并且垂直排列它们。
          //
          // 调用 "debug painting" (在 console 控制台中长按 "p", 选择
          // "Toggle Debug Paint" 来源于 Android Studio 中的 Flutter Inspector，
          // 或者 "Toggle Debug Paint" 命令来源于  Visual Studio Code)
          // 来查看每个元素.
          //
          // Column 有很多个 properties 可以控制怎么定义它的尺寸，还有怎么定位他的子元素
          // 用 mainAxisAlignment 属性来垂直居中它的子元素。
          // 现在主轴是纵轴，
          // 因为 Columns 垂直的 (意味着交叉轴是横向的)。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '当前点击次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // 这个尾随逗号使构建方法的自动格式更好
    );
  }
}
