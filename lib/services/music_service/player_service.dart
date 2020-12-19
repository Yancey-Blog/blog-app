final getPlayers = '''
  query Players {
    players {
      _id
      title
      artist
      lrc
      coverUrl
      musicFileUrl
    }
  }
''';
