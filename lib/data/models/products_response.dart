import 'package:e_commerce/data/models/categories_response.dart';

import 'meta_data.dart';

class ProductsResponse {
  int? results;
  Metadata? metadata;
  List<ProductDM>? data;

  ProductsResponse({
      this.results, 
      this.metadata, 
      this.data});

  ProductsResponse.fromJson(dynamic json) {
    results = json["results"];
    metadata = json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(ProductDM.fromJson(v));
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

class ProductDM {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDM? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDM({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt});

  ProductDM.fromJson(dynamic json) {
    sold = json["sold"];
    images = json["images"] != null ? json["images"].cast<String>() : [];
    if (json["subcategory"] != null) {
      subcategory = [];
      json["subcategory"].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] != null ? CategoryDM.fromJson(json["category"]) : null;
    brand = json["brand"] != null ? Brand.fromJson(json["brand"]) : null;
    ratingsAverage = (json["ratingsAverage"] as num).toDouble();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sold"] = sold;
    map["images"] = images;
    if (subcategory != null) {
      map["subcategory"] = subcategory?.map((v) => v.toJson()).toList();
    }
    map["ratingsQuantity"] = ratingsQuantity;
    map["_id"] = id;
    map["title"] = title;
    map["slug"] = slug;
    map["description"] = description;
    map["quantity"] = quantity;
    map["price"] = price;
    map["imageCover"] = imageCover;
    if (category != null) {
      map["category"] = category?.toJson();
    }
    if (brand != null) {
      map["brand"] = brand?.toJson();
    }
    map["ratingsAverage"] = ratingsAverage;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["id"] = id;
    return map;
  }

}

class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({
      this.id, 
      this.name, 
      this.slug, 
      this.image});

  Brand.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    return map;
  }

}

class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category});

  Subcategory.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["category"] = category;
    return map;
  }

}