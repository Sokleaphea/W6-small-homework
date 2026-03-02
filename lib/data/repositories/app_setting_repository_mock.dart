import '../repositories/app_setting_repository.dart';
import '../../model/settings/app_settings.dart';

class AppSettingsRepositoryMock implements AppSettingRepository {
  AppSettings _settings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(Duration(milliseconds: 100));
    return _settings;
  }

  @override
  Future<void> save(AppSettings settings) async {
    await Future.delayed(Duration(milliseconds: 100));
    _settings = settings;
  }
}