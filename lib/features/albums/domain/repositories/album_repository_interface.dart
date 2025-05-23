import '../entities/album.dart';
import '../entities/photo.dart';

abstract class AlbumRepositoryInterface {
  Future<List<Album>> getAlbums();
  Future<List<Photo>> getPhotosByAlbumId(int albumId);
}
