import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/album_model.dart';
import '../../domain/entities/album.dart';
import 'package:flutter/material.dart';

class AlbumListTile extends StatelessWidget {
  final Album album;

  const AlbumListTile({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      subtitle: Text('Album ID: ${album.id}'),
      onTap: () {
        context.pushNamed(
          'albumDetail',
          extra: AlbumModel(
            id: album.id,
            userId: album.userId,
            title: album.title,
          ),
        );
      },
    );
  }
}
