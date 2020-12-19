import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';

import 'package:blog_app/services/services.dart';
import 'package:blog_app/models/models.dart';

class BestAlbumRepository {
  Future<List<BestAlbum>> fetchBestAlbums() async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(getBestAlbums),
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }

    final bestAlbums = BestAlbumList.fromJson(
        result.data['getBestAlbums'] as List<dynamic>).bestAlbums;

    return bestAlbums;
  }
}
