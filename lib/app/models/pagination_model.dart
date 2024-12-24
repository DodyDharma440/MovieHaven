class PaginationModel<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PaginationModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    List<T> res = [];
    for (var itemJson in json['results']) {
      res.add(fromJsonT(itemJson));
    }

    return PaginationModel(
      page: json['page'],
      results: res,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
