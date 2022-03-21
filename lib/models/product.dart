
class Product {
  String title;
  String img;
  String color;
  String price;
  String desc;

  Product({
    required this.title,
    required this.img,
    required this.color,
    required this.price,
    required this.desc,
  });

  factory Product.fromMap(dynamic map) {
    return Product(
      title: map['title'],
      img: map['img'],
      color: map['color'],
      price: map['price'],
      desc: map['desc'],
    );
  }
}
