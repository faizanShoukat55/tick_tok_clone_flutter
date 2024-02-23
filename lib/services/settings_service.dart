import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tick_tok/main.dart';

import '../models/setting_model.dart';

import '../repositories/setting_repository.dart';
import '../utils/custom_colors.dart';
import '../utils/ui.dart';
import 'translation_service.dart';

class SettingsService extends GetxService {
  final setting = Setting().obs;

  //final address = Address().obs;
  GetStorage? _box;

  SettingRepository? _settingsRepo;

  SettingsService() {
    _settingsRepo = SettingRepository();
    _box = GetStorage();
  }

  Future<SettingsService> init() async {
    ///Default Settings of the app
    setting.value = await _settingsRepo!.get();
    return this;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        dividerColor: Ui.parseColor(setting.value.accentColor!, opacity: 0.1),
        focusColor: Ui.parseColor(setting.value.accentColor!),
        hintColor: Ui.parseColor(setting.value.secondColor!),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Ui.parseColor(setting.value.textPrimaryColor!)),
        ),
        colorScheme: ColorScheme.light(
          primary: Ui.parseColor(setting.value.mainColor!),
          secondary: Ui.parseColor(setting.value.secondColor!),
          tertiary: Ui.parseColor(setting.value.accentColor!),
        ),
        textTheme: GoogleFonts.getTextTheme(
          getLocale().toString().startsWith('ar') ? 'Cairo' : 'Urbanist',
          TextTheme(
            displaySmall: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textPrimaryColor!),
                height: 1.3),
            displayMedium: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textPrimaryColor!),
                height: 1.0),
            displayLarge: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textPrimaryColor!),
                height: 1.0),

          ),
        ));
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xFF252525),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: const Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        dividerColor:
            Ui.parseColor(setting.value.accentDarkColor!, opacity: 0.1),
        focusColor: Ui.parseColor(setting.value.accentDarkColor!),
        hintColor: Ui.parseColor(setting.value.secondDarkColor!),
        toggleableActiveColor: Ui.parseColor(setting.value.mainDarkColor!),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Ui.parseColor(setting.value.textPrimaryColor!)),
        ),
        colorScheme: ColorScheme.dark(
          primary: Ui.parseColor(setting.value.mainDarkColor!),
          secondary: Ui.parseColor(setting.value.secondDarkColor!),
          tertiary: Ui.parseColor(setting.value.accentDarkColor!),
        ),
        textTheme: GoogleFonts.getTextTheme(
            getLocale().toString().startsWith('ar') ? 'Cairo' : 'Urbanist',
            TextTheme(
              displaySmall: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor(setting.value.textPrimaryColor!),
                  height: 1.3),
              displayMedium: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor(setting.value.textPrimaryColor!),
                  height: 1.0),
              displayLarge: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor(setting.value.textPrimaryColor!),
                  height: 1.0),
            )));
  }

  Locale getLocale() {
    String? locale = GetStorage().read<String>('language');
    if (locale == null || locale.isEmpty) {
      locale = setting.value.mobileLanguage ?? "en";
    }
    return Get.find<TranslationService>().fromStringToLocale(locale);
  }

  ThemeMode getThemeMode() {
    String? themeMode = GetStorage().read<String>('theme_mode');
    themeMode = 'ThemeMode.dark';
    switch (themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: secondaryDarkColor,
            statusBarBrightness: Brightness.dark,
            statusBarColor: primaryDarkColor,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );

        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == "dark") {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(
                systemNavigationBarColor: Get.theme.colorScheme.primary),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
                .copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }
}
