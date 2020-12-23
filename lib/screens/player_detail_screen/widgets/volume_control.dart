import 'package:flutter/material.dart';

class VolumeControl extends StatefulWidget {
  VolumeControl({Key key}) : super(key: key);

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.volume_down,
          ),
          Expanded(
            child: Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          Icon(
            Icons.volume_up,
          )
        ],
      ),
    );
  }
}
