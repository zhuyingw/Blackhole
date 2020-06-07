import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Hole',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Black Hole'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  var hstyle = TextStyle(fontSize: 30, color: Colors.black);
  String text = "";

  Animation<double> animation;
  AnimationController controller;

  var _controller = TextEditingController();

  void _showDialog() async{
    // flutter defined function
    await Future.delayed(Duration(milliseconds: 800));
    _controller.clear();
    controller.reverse();
    showDialog(
      context: context,
      builder: (BuildContext context)
    {
      // return object of type Dialog
      if(text.contains("kill") || text.contains("death") || text.contains("die")
      || text.contains("suicide") || text.contains("depression")){
      return AlertDialog(
        title: new Text(
          "Please seek for help", textAlign: TextAlign.center,),
        content: new Text("Call this number 12345678", textAlign: TextAlign.center,),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Call"),
            onPressed: () async{
              var url = "tel:12345678";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
      else{
        return AlertDialog(
          title: new Text(
            "Your bad thoughts are gone!", textAlign: TextAlign.center,),
          content: new Text("Take a deep breath", textAlign: TextAlign.center,),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 300, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
  }

  void _letGo() {
    setState(() {
        controller.forward();
        _showDialog();
    });
  }

  phone() async{
    const url = "tel:";
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1.0),
        body:
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
                child: IconButton(
                    onPressed: phone,
                    iconSize: 50,
                    icon: Icon(Icons.phone, color: Colors.green, )
                ),
              ),
            ),

            Center(child: Image.asset('assets/bl.gif')),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: animation.value * 2,
                  height: animation.value / 5,
                  child: new TextField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Text your thoughts',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (String str){
                      setState(() {
                        text = str;
                      });
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: ButtonTheme(
                  minWidth: 180,
                  height: 60,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                      elevation: 15.0,
                      color: Colors.white,
                      onPressed: _letGo,
                      child: Text("Let it go", style: hstyle, textAlign: TextAlign.center)
                  ),
                ),
              ),
            )

          ],
        ));
  }
}
