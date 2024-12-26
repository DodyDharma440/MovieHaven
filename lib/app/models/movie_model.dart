class MovieGenreModel {
  final int id;
  final String name;

  MovieGenreModel({required this.id, required this.name});

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) {
    return MovieGenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class MovieProdCompanyModel {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  MovieProdCompanyModel({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  factory MovieProdCompanyModel.fromJson(Map<String, dynamic> json) {
    return MovieProdCompanyModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}

class MovieModel {
  final int id;
  final bool adult;
  final String? backdropPath;
  final List<int>? genreIds;

  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  final List<MovieGenreModel>? genres;
  final List<MovieProdCompanyModel>? productionCompanies;
  final List<String>? languages;

  final String? tagline;
  final String? status;

  MovieModel({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.productionCompanies,
    required this.languages,
    required this.tagline,
    required this.status,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds:
          json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : null,
      genres: json['genres']
          ?.map<MovieGenreModel>((el) => MovieGenreModel.fromJson(el))
          .toList(),
      productionCompanies: json['production_companies']
          ?.map<MovieProdCompanyModel>(
              (el) => MovieProdCompanyModel.fromJson(el))
          .toList(),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      languages: json['spoken_languages']
          ?.map<String>((el) => (el['english_name'] ?? "-") as String)
          .toList(),
      tagline: json['tagline'],
      status: json['status'],
    );
  }
}
