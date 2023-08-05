class AzkarItem {
  final String arabicText;

  AzkarItem({required this.arabicText});

  factory AzkarItem.fromJson(dynamic json) {
    return AzkarItem(arabicText: json['ARABIC_TEXT']);
  }
}
