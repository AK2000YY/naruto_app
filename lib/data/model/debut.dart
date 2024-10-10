class Debut {
  String? manga;
  String? anime;
  String? novel;
  String? movie;
  String? appearsIn;

  Debut({this.manga, this.anime, this.novel, this.movie, this.appearsIn});

  factory Debut.fromJson(Map<String, dynamic>? json) {
    return Debut(
      manga: json?['manga'] as String?,
      anime: json?['anime'] as String?,
      novel: json?['novel'] as String?,
      movie: json?['movie'] as String?,
      appearsIn: json?['appearsIn'] as String?,
    );
  }
}