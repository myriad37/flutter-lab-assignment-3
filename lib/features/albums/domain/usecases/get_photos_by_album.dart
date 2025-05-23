import '../entities/photo.dart';
import '../repositories/album_repository_interface.dart';

class GetPhotosByAlbum {
  final AlbumRepositoryInterface repository;

  GetPhotosByAlbum(this.repository);

  Future<List<Photo>> call(int albumId) {
    return repository.getPhotosByAlbumId(albumId);
  }
}
