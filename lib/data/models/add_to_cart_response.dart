class AddToCartResponse {
  String? status;
  String? message;
  int? numOfCartItems;
  AddToCartData? data;

  AddToCartResponse({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data});

  AddToCartResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    numOfCartItems = json["numOfCartItems"];
    data = json["data"] != null ? AddToCartData.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["numOfCartItems"] = numOfCartItems;
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }

}

class AddToCartData {
  String? id;
  String? cartOwner;
  List<AddToCartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  AddToCartData({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice});

  AddToCartData.fromJson(dynamic json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products?.add(AddToCartProduct.fromJson(v));
      });
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["cartOwner"] = cartOwner;
    if (products != null) {
      map["products"] = products?.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    map["totalCartPrice"] = totalCartPrice;
    return map;
  }

}

class AddToCartProduct {
  int? count;
  String? id;
  String? product;
  int? price;

  AddToCartProduct({
      this.count, 
      this.id, 
      this.product, 
      this.price});

  AddToCartProduct.fromJson(dynamic json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["count"] = count;
    map["_id"] = id;
    map["product"] = product;
    map["price"] = price;
    return map;
  }

}