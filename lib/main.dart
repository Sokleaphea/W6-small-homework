import 'package:provider/provider.dart';
import 'package:w6_homework/main_production.dart';
import './data/repositories/songs/song_repository_mock.dart';
import 'data/repositories/songs/song_repository.dart';
import 'main_common.dart';


/// Configure provider dependencies for dev environement
List<Provider> get providersLocal {
  return [Provider<SongRepository>(create: (context) => SongRepositoryMock())];
}

void main() {
  mainCommon(providersProduction);
}
