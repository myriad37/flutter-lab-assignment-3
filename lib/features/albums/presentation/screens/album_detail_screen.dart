import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/http_client.dart';
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';
import '../../data/repositories/album_repository.dart';
import '../../domain/entities/photo.dart';
import 'package:http/http.dart' as http;
// or wherever CustomHttpClient is
import '../../data/repositories/album_repository.dart';

class AlbumDetailScreen extends StatefulWidget {
  final AlbumModel album;

  const AlbumDetailScreen({super.key, required this.album});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  late Future<List<Photo>> _photosFuture;

  @override
  void initState() {
    super.initState();
    final repository =
        AlbumRepository(client: CustomHttpClient(client: http.Client()));
    _photosFuture = repository.getPhotosByAlbumId(widget.album.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.album.title)),
      body: FutureBuilder<List<Photo>>(
        future: _photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        final repository =
                            RepositoryProvider.of<AlbumRepository>(context);
                        _photosFuture =
                            repository.getPhotosByAlbumId(widget.album.id);
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No photos found.'));
          }

          final photos = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final photo = photos[index];
              return Column(
                children: [
                  Image.network(photo.thumbnailUrl,
                      height: 80, fit: BoxFit.cover),
                  const SizedBox(height: 4),
                  Text(photo.title,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
