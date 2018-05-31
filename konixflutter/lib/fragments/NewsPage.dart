import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),

          itemBuilder: (BuildContext context, int index) =>
              buildTextViews(index),
        )
    );
  }

  Widget buildTextViews(int i) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[ new Text("Item number " + i.toString(),
            style: new TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }
}