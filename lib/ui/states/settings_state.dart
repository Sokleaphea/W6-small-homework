import 'package:flutter/widgets.dart';
import 'package:w6_homework/data/repositories/app_setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingRepository repository;

  AppSettings? _appSettings;
  bool _loading = true;

  AppSettingsState({required this.repository}) {
    init();
  }
  AppSettings? get appSettings => _appSettings;
  bool get loading => _loading;
  Future<void> init() async {
    _loading = true;
    notifyListeners();

    _appSettings = await repository.load();
    _loading = false;
    notifyListeners();
    // Might be used to load data from repository
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
    await repository.save(_appSettings!);
  }
}
