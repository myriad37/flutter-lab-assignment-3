import '../../domain/entities/photo.dart';

class PhotoModel {
  final int id;
  final int albumId;
  final String url;
  final String thumbnailUrl;
  final String title;

  PhotoModel({
    required this.id,
    required this.albumId,
    required this.url,
    required this.thumbnailUrl,
    required this.title,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        albumId: json['albumId'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
        title: json['title'],
        id: json['id']);
  }

  Photo toEntity() {
    return Photo(
        albumId: albumId,
        url: url,
        thumbnailUrl: thumbnailUrl,
        title: title,
        id: id);
  }
}
