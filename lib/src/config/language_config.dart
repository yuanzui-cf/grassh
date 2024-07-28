import 'dart:ui';

const Map<String, String> language = {
  "en": "🇺🇸 English",
  "zh": "🇨🇳 中文",
  "zh-CN": "🇨🇳 简体中文",
  "zh-TW": "🇭🇰 繁體中文",
};

const Map<String, Locale> languageCode = {
  "en": Locale('en'),
  "zh": Locale('zh'),
  "zh-CN": Locale('zh', 'CN'),
  "zh-TW": Locale('zh', 'TW'),
};
