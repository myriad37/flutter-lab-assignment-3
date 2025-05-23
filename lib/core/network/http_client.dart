import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../error/exceptions.dart';
import 'dart:convert';

class CustomHttpClient {
  final http.Client client;

  CustomHttpClient({required this.client});

  Future<dynamic> get(String url) async {
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw NotFoundException('Resource not found');
      } else if (response.statusCode >= 500) {
        throw ServerException('Server error occurred');
      } else {
        throw HttpException('Failed to fetch data: ${response.statusCode}');
      }
    } on FormatException {
      throw DataParsingException('Failed to parse response data');
    } catch (e) {
      throw NetworkException('Network error occurred: $e');
    }
  }

  void dispose() {
    client.close();
  }
}
