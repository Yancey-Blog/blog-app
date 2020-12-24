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

  Widget _renderedPlayerStatus(
      BuildContext context, PlayerControllerState state) {
    Widget _renderedWidget = IconButton(
      icon: Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      onPressed: () => {
        BlocProvider.of<PlayerControllerBloc>(context).add(
          AudioPlayed(audio: player),
        ),
      },
    );

    if (state is AudioLoadInProgress) {
      _renderedWidget = CircularProgressIndicator();
    }

    if (state is AudioPauseSuccess) {
      _renderedWidget = IconButton(
        icon: Icon(
          Icons.pause,
          color: Colors.black,
        ),
        onPressed: () => {
          BlocProvider.of<PlayerControllerBloc>(context).add(
            AudioPaused(),
          )
        },
      );
    }

    if (state is AudioPauseSuccess) {
      _renderedWidget = IconButton(
        icon: Icon(
          Icons.pause,
          color: Colors.black,
        ),
        onPressed: () => {
          BlocProvider.of<PlayerControllerBloc>(context).add(
            AudioPaused(),
          )
        },
      );
    }

    return _renderedWidget;
  }

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
                child: _renderedPlayerStatus(context, state),
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
