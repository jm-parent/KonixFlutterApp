import 'package:flutter/material.dart';

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CustomScrollView(slivers: <Widget>[
      const SliverAppBar(
        title: const Text('Sliver App Bar'),
      ),
      new SliverList(
          delegate: new SliverChildListDelegate(buildTextViews(50)))
    ]);
  }
  List buildTextViews(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(padding: new EdgeInsets.all(16.0),
          child: new Text("Item number " + i.toString(),
              style: new TextStyle(fontSize: 20.0))));
    }
    return strings;
  }
}