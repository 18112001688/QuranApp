import 'package:Qurane_app/Features/detail/data/models/ahdes_model/item.dart';

class HdesModel{ 
 final List<Item> items;

  HdesModel( {required this.items});

  factory HdesModel.fromJson(Map<String, dynamic> json) {
    return HdesModel(
      items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    );
  }
}