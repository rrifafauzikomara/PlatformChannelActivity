import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Code from Dart'),
      ),
      body: MyHomePage(),
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

  static const platform = MethodChannel("test_activity");

  @override
  void initState() {
    super.initState();
  }

  _getNewActivity() async {
    try {
      await platform.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, rowNumber) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text('Flutter Component',
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0,),
                MaterialButton(
                    child: Text('Open Screen'),
                    elevation: 5.0,
                    height: 48.0,
                    minWidth: 250.0,
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      print("button pressed");
                      _getNewActivity();
                    }),
              ],
            ),
          );
        });
  }
}