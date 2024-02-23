import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tick_tok/providers/json_data_provider.dart';
import 'package:tick_tok/providers/network_client_provider.dart';
import 'package:tick_tok/routes/app_pages.dart';
import 'package:tick_tok/services/global_service.dart';
import 'package:tick_tok/services/settings_service.dart';
import 'package:tick_tok/services/translation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// logger package
Logger logger = Logger();

Future<bool> initServices() async {
  Get.log("starting services");
  await GetStorage.init();
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => NetworkApiClient().init());
  await Get.putAsync(() => JsonApiClient().init());
  await Get.putAsync(() => SettingsService().init());

  Get.log("All services has been started.");
  return true;
}

void main() async {
  ///Init Services
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  ///Error Widget Screen
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: Colors.green.shade200,
        child: Center(
            child: Text(
          details.exception.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    onReady: () {},
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    defaultTransition: Transition.cupertino,
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: Get.find<TranslationService>().supportedLocales(),
    translationsKeys: Get.find<TranslationService>().translations,
    locale: Get.find<SettingsService>().getLocale(),
    themeMode: Get.find<SettingsService>().getThemeMode(),
    theme: Get.find<SettingsService>().getLightTheme(),
    darkTheme: Get.find<SettingsService>().getDarkTheme(),
    title: Get.find<SettingsService>().setting.value.appName ?? "",
  ));
}
