import '../entities/album.dart';
import '../repositories/album_repository_interface.dart';

class GetAlbums {
  final AlbumRepositoryInterface repository;

  GetAlbums(this.repository);

  Future<List<Album>> call() {
    return repository.getAlbums();
  }
}
