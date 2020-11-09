import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('SliverAppBar'),
          // backgroundColor: Colors.red,
          expandedHeight: 240.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
                'https://eskipaper.com/images/forest-wallpaper-13.jpg',
                fit: BoxFit.cover),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              // TaskList(posts, refetch),
              // Container(child: TaskList(posts, refetch)),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),
      ],
    ));
  }
}
