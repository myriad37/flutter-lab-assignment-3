class AppException implements Exception {
  final String message;
  const AppException([this.message = 'An unexpected error occurred']);

  @override
  String toString() => message;
}

class BadRequestException extends AppException {
  const BadRequestException([super.message = 'Bad request']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized']);
}

//class NotFoundException extends AppException {
// const NotFoundException([super.message = 'Not found']);
//}

//class ServerException extends AppException {
//  const ServerException([super.message = 'Server error']);
//}

class FetchDataException extends AppException {
  const FetchDataException([super.message = 'Error fetching data']);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class DataParsingException implements Exception {
  final String message;
  DataParsingException(this.message);
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
}
