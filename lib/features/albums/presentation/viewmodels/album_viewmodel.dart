import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';
import '../../domain/usecases/get_albums.dart';
import '../../domain/usecases/get_photos_by_album.dart';
import '../../domain/entities/album.dart';
import '../../domain/entities/photo.dart';

class AlbumViewModel {
  final GetAlbums getAlbums;
  final GetPhotosByAlbum getPhotosByAlbum;

  AlbumViewModel({
    required this.getAlbums,
    required this.getPhotosByAlbum,
  });

  Future<List<Album>> fetchAlbums() => getAlbums();

  Future<List<Photo>> fetchPhotos(int albumId) =>
      getPhotosByAlbum(albumId);
}
