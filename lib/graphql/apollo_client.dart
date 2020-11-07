import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/shared/constants.dart';

final client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    cache: OptimisticCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
    link: HttpLink(uri: apiUrl),
  ),
);
