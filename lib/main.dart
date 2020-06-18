import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:test_animations/description.dart';
import 'package:test_animations/homepagetoppart.dart';
import 'package:test_animations/pageone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
      materialApp: MaterialApp(
        routes: {
          '/home': (context) => MyHomePage(),
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;
  double progress = 0.0;

  initState() {
    super.initState();
    controller = PageController()
      ..addListener(() {
        progress = controller.offset / controller.position.maxScrollExtent;
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            HOmePageTopPart(
              progress: progress,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              child: PageView(
                controller: controller,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  TabFirst(
                    previous: false,
                  ),
                  TabFirst(
                    previous: false,
                  ),
                  TabFirst(
                    previous: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
