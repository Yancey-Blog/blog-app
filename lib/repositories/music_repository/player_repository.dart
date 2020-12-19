import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';

import 'package:blog_app/services/services.dart';
import 'package:blog_app/models/models.dart';

class PlayerRepository {
  Future<List<Player>> fetchPlayers() async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(getPlayers),
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }

    final players = PlayerList.fromJson(
      result.data['players'] as List<dynamic>,
    ).players;

    return players;
  }
}
