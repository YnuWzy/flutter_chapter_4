import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ListTile(
            title: Text('大小测试'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SizedBoxTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('文字显示'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RowColumnTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('FlexTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlexTest(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('FlowTest'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlowTest(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SizedBoxTest extends StatefulWidget {
  const SizedBoxTest({Key? key}) : super(key: key);

  @override
  State<SizedBoxTest> createState() => _SizedBoxTestState();
}

class _SizedBoxTestState extends State<SizedBoxTest> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.blue),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SizedBox"),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 60,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: Container(
                  height: 5.0,
                  child: redBox,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: redBox,
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: redBox,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                    child: UnconstrainedBox(
                      //“去除”父级限制
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                        child: redBox,
                      ),
                    ))),
          ],
        ));
  }
}

class RowColumnTest extends StatefulWidget {
  const RowColumnTest({Key? key}) : super(key: key);

  @override
  State<RowColumnTest> createState() => _RowColumnTestState();
}

class _RowColumnTestState extends State<RowColumnTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowColumn"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Nice to meet you "),
                    Text(" 你在玩什么呢 "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(
                      " hello world ",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(" I am Jack "),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlexTest extends StatefulWidget {
  const FlexTest({Key? key}) : super(key: key);

  @override
  State<FlexTest> createState() => _FlexTestState();
}

class _FlexTestState extends State<FlexTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex"),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class FlowTest extends StatefulWidget {
  const FlowTest({Key? key}) : super(key: key);

  @override
  State<FlowTest> createState() => _FlowTestState();
}

class _FlowTestState extends State<FlowTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flow"),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.orange,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.blue,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.yellow,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.brown,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
