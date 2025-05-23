import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'config/router/app_router.dart';
import 'core/network/http_client.dart';
import 'features/albums/data/repositories/album_repository.dart';
import 'features/albums/presentation/blocs/album_bloc.dart';
import 'features/albums/presentation/blocs/album_event.dart';
void main() {
  final httpClient = CustomHttpClient(client: http.Client());
  final albumRepository = AlbumRepository(client: httpClient);
  runApp(MyApp(albumRepository: albumRepository));
}
class MyApp extends StatelessWidget {
  final AlbumRepository albumRepository;
  const MyApp({super.key, required this.albumRepository});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlbumBloc(albumRepository)..add(FetchAlbums()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: router,
      ),
    );
  }
}
