import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/albums/presentation/screens/album_list_screen.dart';
import '../../features/albums/presentation/screens/album_detail_screen.dart';
import '../../features/albums/data/models/album_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumListScreen(),
    ),
    GoRoute(
      path: '/album/detail',
      name: 'albumDetail',
      pageBuilder: (context, state) {
        final album = state.extra;
        if (album is! AlbumModel) {
          throw Exception('Expected AlbumModel but got ${album.runtimeType}');
        }
        return MaterialPage(child: AlbumDetailScreen(album: album));
      },
    ),
  ],
);
