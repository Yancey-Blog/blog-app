import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

QueryBuilder withGenericHandling(QueryBuilder builder) {
  return (result, {fetchMore, refetch}) {
    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.loading) {
      return const Center(
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return builder(result, fetchMore: fetchMore, refetch: refetch);
  };
}
