// import 'dart:html';

import 'package:finance/presentationColr/styles/app_colors.dart';
import 'package:finance/servicesCol/storage/storage_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final StorageService storageService;

  ThemeProvider(this.storageService) {
    selectedPrimaryColor = storageService.get(StorageKeys.primaryColor) == null
        ? AppColors.primary
        : Color(storageService.get(StorageKeys.primaryColor));

    selectedThemeMode = storageService.get(StorageKeys.themeMode) == null
        ? ThemeMode.system
        : ThemeMode.values.byName(storageService.get(StorageKeys.themeMode));
  }

  late Color selectedPrimaryColor;

  setSelectedPrimarycolor(Color _color) {
    selectedPrimaryColor = _color;
    storageService.set(StorageKeys.primaryColor, _color.value);
    notifyListeners();
  }

  late ThemeMode selectedThemeMode;

  setSelectedThemeMode(ThemeMode _mode) {
    selectedThemeMode = _mode;
    storageService.set(StorageKeys.themeMode, _mode.name);
    notifyListeners();
  }
}
