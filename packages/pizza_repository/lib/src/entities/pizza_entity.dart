import 'macros_entity.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  double price;
  double discount;
  MacrosEntity macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toDocument(),
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
        pizzaId: doc['pizzaId'].toString(),
        picture: doc['picture'].toString(),
        isVeg: bool.tryParse(doc['isVeg'].toString()) ?? false,
        spicy: int.tryParse(doc['spicy'].toString()) ?? 0,
        name: doc['name'].toString(),
        description: doc['description'].toString(),
        price: double.parse(doc['price'].toString()),
        discount: double.parse(doc['discount'].toString()),
        macros: MacrosEntity.fromDocument(doc['macros']));
  }
}
