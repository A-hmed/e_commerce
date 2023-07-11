import 'package:e_commerce/data/models/products_response.dart';

class GetUserCartResponse {
  String? status;
  int? numOfCartItems;
  CartData? data;

  GetUserCartResponse({
      this.status, 
      this.numOfCartItems, 
      this.data});

  GetUserCartResponse.fromJson(dynamic json) {
    status = json["status"];
    numOfCartItems = json["numOfCartItems"];
    data = json["data"] != null ? CartData.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["numOfCartItems"] = numOfCartItems;
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }

}

class CartData {
  String? id;
  String? cartOwner;
  List<CartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartData({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice});

  CartData.fromJson(dynamic json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products?.add(CartProduct.fromJson(v));
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

class CartProduct {
  int? count;
  String? id;
  ProductDM? product;
  int? price;

  CartProduct({
      this.count, 
      this.id, 
      this.product, 
      this.price});

  CartProduct.fromJson(dynamic json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"] != null ? ProductDM.fromJson(json["product"]) : null;
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["count"] = count;
    map["_id"] = id;
    if (product != null) {
      map["product"] = product?.toJson();
    }
    map["price"] = price;
    return map;
  }

}