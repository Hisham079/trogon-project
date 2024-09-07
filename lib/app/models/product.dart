import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int productId;
  String name;
  String description;
  double price;
  String unit;
  String image;
  int discount;
  bool availability;
  String brand;
  String category;
  double rating;
  List<Review>? reviews;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        unit: json["unit"],
        image: json["image"],
        discount: json["discount"],
        availability: json["availability"],
        brand: json["brand"],
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "unit": unit,
        "image": image,
        "discount": discount,
        "availability": availability,
        "brand": brand,
        "category": category,
        "rating": rating,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Review {
  int userId;
  int rating;
  String comment;

  Review({
    required this.userId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        userId: json["user_id"],
        rating: json["rating"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "rating": rating,
        "comment": comment,
      };
}
