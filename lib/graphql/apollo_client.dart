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

// @override
// String typenameDataIdFromObject(Object object) {
//   if (object is Map<String, Object> &&
//       object.containsKey('__typename') &&
//       object.containsKey('_id')) {
//     return "${object['__typename']}/${object['_id']}";
//   }
//   return null;
// }