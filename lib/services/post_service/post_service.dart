final postItemFragment = '''
  fragment PostItemFragment on PostItemModel {
    _id
    posterUrl
    title
    summary
    tags
    lastModifiedDate
    like
    pv
    isPublic
    createdAt
    updatedAt
  }
''';

final posts = '''
  query Posts(\$input: PaginationInput!) {
    posts(input: \$input) {
      total
      page
      pageSize
      items {
        ...PostItemFragment
      }
    }
  }
  $postItemFragment
''';

final getPostById = '''
  query GetPostById(\$id: ID!) {
    getPostById(id: \$id) {
      content
      ...PostItemFragment
      prev {
        _id
        posterUrl
        title
      }
      next {
        _id
        posterUrl
        title
      }
    }
  }
  $postItemFragment
''';
