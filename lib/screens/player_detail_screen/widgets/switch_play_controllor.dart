import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/blocs/blocs.dart';

class SwitchPlayControllor extends StatelessWidget {
  final Player player;

  SwitchPlayControllor({
    Key key,
    @required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerControllerBloc, PlayerControllerState>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            CupertinoIcons.arrow_2_circlepath,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.backward_end,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  onPressed: () => {
                    BlocProvider.of<PlayerControllerBloc>(context).add(
                      AudioPlayed(audio: player),
                    )
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.forward_end,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Icon(
            CupertinoIcons.arrow_swap,
            color: Colors.black,
          ),
        ],
      );
    });
  }
}
