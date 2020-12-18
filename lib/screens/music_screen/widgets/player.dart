import 'package:flutter/material.dart';
import './music_item.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/music_screen/top-bg@3x.png',
              width: MediaQuery.of(context).size.width,
              height: 510,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff0b0f26),
                  ),
                ),
              ),
              Container(
                height: 64.0 * 10,
                child: ListView.separated(
                  itemCount: 10,
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.black12,
                    );
                  },
                  itemBuilder: (context, index) {
                    return MusicItem(index: index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
