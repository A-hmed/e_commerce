class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage});

  Metadata.fromJson(dynamic json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["currentPage"] = currentPage;
    map["numberOfPages"] = numberOfPages;
    map["limit"] = limit;
    map["nextPage"] = nextPage;
    return map;
  }

}