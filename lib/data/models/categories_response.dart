import 'meta_data.dart';

class CategoriesResponse {
  int? results;
  Metadata? metadata;
  List<CategoryDM>? data;

  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data});

  CategoriesResponse.fromJson(dynamic json) {
    results = json["results"];
    metadata = json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(CategoryDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["results"] = results;
    if (metadata != null) {
      map["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CategoryDM {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryDM({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt});

  CategoryDM.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }
}