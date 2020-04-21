import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homestate();
  }

}

class homestate extends State<Home>{
  final TextEditingController weight = new TextEditingController();
  int radiovalue = 0;
  double result=0.0;

  void handleit(int value)
  {
    setState(() {
      radiovalue=value;
      switch(radiovalue)
      {
        case 0:
          result = calculate(weight.text,0.38);
          break;
        case 1:
          result = calculate(weight.text,2.34);
          break;
        case 2:
          result = calculate(weight.text,0.92);
          break;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 133.0,
            width: 200.0,),

            new Container(
                 margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight on Earth",
                      hintText: "In Pounds",
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>
                        (activeColor: Colors.red,
                          value: 0, groupValue: radiovalue, onChanged: handleit),
                      new Text(
                        "Mars",
                      style: new TextStyle(color: Colors.white30),),
                      new Radio<int>
                        (activeColor: Colors.orangeAccent,
                          value: 1, groupValue: radiovalue, onChanged: handleit),
                      new Text(
                        "Jupiter",
                        style: new TextStyle(color: Colors.white30),),
                      new Radio<int>
                        (activeColor: Colors.lightBlueAccent,
                          value: 2, groupValue: radiovalue, onChanged: handleit),
                      new Text(
                        "Uranus",
                        style: new TextStyle(color: Colors.white30),)
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(16.0)),
                  new Text(
                    "$result",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculate(String w, double m) {
    if(int.parse(w).toString().isNotEmpty && int.parse(w)>0)
      {
        return int.parse(w)*m;
      }
    else{
      print("Wrong");
      return 0.0;
    }
  }
}
