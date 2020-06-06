import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new MyApp()
    )
  );
}




class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp>{


  void onPressed(){
    setState(() {

    });
  }

  String text = "";

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Container(
        child: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                new TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Text whatever you like',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (String str){
                    setState(() {
                      text = str;
                    });
                  },
                ),
                new RaisedButton(
                    child: new Text("Let it go"),
                    color: Colors.white,
                    onPressed: onPressed
    )
        ]
    )
    )
    )
    );
  }
}
