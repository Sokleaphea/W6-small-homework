import 'package:provider/provider.dart';
import 'package:w6_homework/data/repositories/songs/song_repository.dart';
import 'package:w6_homework/data/repositories/songs/song_repository_remote.dart';
import 'package:w6_homework/main_common.dart';

List<Provider> get providersProduction {
  return [
    Provider<SongRepository>(create: (context) => SongRepositoryRemote(),
    ),
  ];
}

void main() {
  mainCommon(providersProduction);
}