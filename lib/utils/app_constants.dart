import 'package:flutter/material.dart';
import 'package:resume_creator/utils/images.dart';

class AppConstants {
  static const String appName = 'Career Resume';
  static const String appVersion = '1.0';

  static const String baseUrl = '';
  static const String registerUri = 'registration';
  static const String loginUri = 'login';
  static const String addToCart = 'add';
  static const String resetPasswordUri = 'reset';


  static List<ChooseUsModel> whyChooseUsList = [
    ChooseUsModel(
        icon: Images.landingTrusted,
        title: 'trusted_by_customers_and_store_owners'),
    ChooseUsModel(icon: Images.landingStores, title: 'thousands_of_stores'),
    ChooseUsModel(
        icon: Images.landingExcellent, title: 'excellent_shopping_experience'),
    ChooseUsModel(
        icon: Images.landingCheckout,
        title: 'easy_checkout_and_payment_system'),
  ];

  // Shared Key
  static const String theme = 'career_theme';
  static const String onboarding = 'onboarding';
  static const String isLogin = 'isLogin';
  static const String token = 'career_token';
  static const String countryCode = 'career_country_code';
  static const String languageCode = 'career_language_code';
  static const String cartList = 'career_cart_list';
  static const String acceptCookies = 'career_accept_cookies';
  static const String userPassword = 'career_user_password';
  static const String userAddress = 'career_user_address';
  static const String userNumber = 'career_user_number';
  static const String userCountryCode = 'career_user_country_code';
  static const String notification = 'career_notification';
  static const String searchHistory = 'career_search_history';
  static const String notificationCount = 'career_notification_count';
  static const String isSplashScreen = 'career_splash_seen';
  static const String cookiesManagement = 'cookies_management';
  static const String topic = 'customer';
  static const String zoneId = 'zoneId';
  static const String localizationKey = 'X-localization';
  static const int scheduleTime = 3;

  static Map<String, String> configHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
    AppConstants.zoneId: 'configuration',
  };

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.us,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabicTwo,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
  static const double limitOfPickedImageSizeInMB = 2;
}

class ChooseUsModel {
  String? icon;
  String? title;

  ChooseUsModel({required this.icon, required this.title});
}


class LanguageModel {
  String? imageUrl;
  String? languageName;
  String? languageCode;
  String? countryCode;

  LanguageModel(
      {this.imageUrl, this.languageName, this.countryCode, this.languageCode});
}

