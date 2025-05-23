import '../../domain/entities/album.dart';

class AlbumModel {
  final int id;
  final int userId;
  final String title;

  AlbumModel({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
  Album toEntity() {
    return Album(id: id, userId: userId, title: title);
  }
}

//class PhotoModel {
//  final int id;
//  final int userId;
// final String title;

// //PhotoModel({
//  required this.id,
//   required this.userId,
//required this.title,
// });

//factory PhotoModel.fromJson(Map<String, dynamic> json) {
//return PhotoModel(
//id: json['id'],
//userId: json['userId'],
//title: json['title'],
//);
// }
//}
