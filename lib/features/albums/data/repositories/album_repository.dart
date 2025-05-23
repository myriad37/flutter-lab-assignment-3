import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/network/http_client.dart';
import '../../../../core/error/exceptions.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart' as photo;
import '../../domain/repositories/album_repository_interface.dart';
import '../../domain/entities/album.dart';
import '../../domain/entities/photo.dart';
import '../models/photo_model.dart';

class AlbumRepository implements AlbumRepositoryInterface {
  final CustomHttpClient client;
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  AlbumRepository({required this.client});

  @override
  Future<List<Album>> getAlbums() async {
    try {
      final response = await client.get('$baseUrl/albums');
      final List<dynamic> data = response;
      return data.map((json) => AlbumModel.fromJson(json).toEntity()).toList();
    } on AppException catch (e) {
      throw Exception('Failed to load albums: ${e.message}');
    }
  }

  @override
  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    try {
      final response = await client.get('$baseUrl/photos?albumId=$albumId');
      final List<dynamic> data = response;
      return data.map((json) => PhotoModel.fromJson(json).toEntity()).toList();
    } on AppException catch (e) {
      throw Exception('Failed to load photos: ${e.message}');
    }
  }
}
