class CartModel {
  final int productId;
  final String color;
  final String size;
  final int quantity;

  CartModel(
      {required this.productId,
      required this.color,
      required this.size,
      required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity
    };
  }
}

/*
{
"product_id":1,
"color":"Red",
"size":"X",
"qty":5
}*/
