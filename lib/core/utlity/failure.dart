import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFilauire extends Failure {
  ServerFilauire(super.errorMessage);

  factory ServerFilauire.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFilauire('connection timeout with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFilauire('Send timeout with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFilauire('Reccive timeout with apiServer');

      case DioExceptionType.badCertificate:
        return ServerFilauire('bad Certificate with apiServer');

      case DioExceptionType.badResponse:
        return ServerFilauire.fromResponse(
            dioError.response!.statusCode!, dioError.response);

      case DioExceptionType.cancel:
        return ServerFilauire('Request to api server is canceled');

      case DioExceptionType.connectionError:
        return ServerFilauire('connection Error with apiServer');

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            (dioError.message!.contains('SocketException') ||
                dioError.message!.contains('Failed host lookup'))) {
          // Handle no internet connection here
          return ServerFilauire('no internet connection occurred');
        }
        break;

      default:
        return ServerFilauire(
            'Opps There was an error, please try agein later');
    }
    return ServerFilauire('Unexpected Error');
  }

  factory ServerFilauire.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFilauire(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFilauire('Your Request Not Found, please try again later');
    } else if (statusCode == 500) {
      return ServerFilauire('Internal Server error, Please try agein later');
    } else {
      return ServerFilauire('Opps, There was an error');
    }
  }
}
