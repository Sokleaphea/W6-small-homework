import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:w6_homework/data/repositories/app_setting_repository_mock.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';
import './data/repositories/app_setting_repository.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    Provider<AppSettingRepository>(create: (_) => AppSettingsRepositoryMock()),
    ChangeNotifierProvider<AppSettingsState>(
      create: (context) =>
          AppSettingsState(repository: context.read<AppSettingRepository>()),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
