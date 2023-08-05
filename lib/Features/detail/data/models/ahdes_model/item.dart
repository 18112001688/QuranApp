
class Item {
 final String arab;

  Item({required this.arab});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      arab: json['arab'],
    );
  }
}