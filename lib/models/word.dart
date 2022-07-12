class Word {
  final String word;

  const Word({
    required this.word,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
    );
  }
}
