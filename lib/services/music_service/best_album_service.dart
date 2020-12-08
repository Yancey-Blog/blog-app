final getBestAlbums = '''
  query GetBestAlbums {
    getBestAlbums {
      _id
      title
      artist
      coverUrl
      mvUrl
      releaseDate
      createdAt
      updatedAt
    }
  }
''';
