import 'package:Qurane_app/Features/detail/data/models/azkar_model/azkar_item.dart';

class AzkarData {
  final List<AzkarItem> azkarList;

  AzkarData({required this.azkarList});

  factory AzkarData.fromJson(Map<String, dynamic> json) {
    var azkarItemsList = json['أذكار الصباح والمساء'] as List;
    List<AzkarItem> azkarList =
        azkarItemsList.map((item) => AzkarItem.fromJson(item)).toList();

    return AzkarData(azkarList: azkarList);
  }
}
