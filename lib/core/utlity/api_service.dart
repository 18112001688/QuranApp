import 'package:dio/dio.dart';

class ApiServicePrayerTime {
  final Dio dio;
  final baseUrl = 'https://api.aladhan.com/v1/calendarByCity/2017/4?city=';

  ApiServicePrayerTime(this.dio);

  Future<Map<String, dynamic>> get({required String city}) async {
    final url = '$baseUrl$city&country=Egypt%&method=2';

    var response = await dio.get(url);

    return response.data;
  }
}

class ApiServiceAhdes {
  final Dio dio;
  final baseUrl =
      'https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=';

  ApiServiceAhdes(this.dio);

  Future<Map<String, dynamic>> get({required int limit}) async {
    final url = '$baseUrl$limit';

    var response = await dio.get(url);

    return response.data;
  }
}

class ApiServicesAzkar {
  final Dio dio;
  final baseUrl = 'https://www.hisnmuslim.com/api/ar/';

  ApiServicesAzkar(this.dio);

  Future<Map<String, dynamic>> get({required datatype}) async {
    final url = '$baseUrl$datatype';

    var response = await dio.get(url);

    return response.data;
  }
}
