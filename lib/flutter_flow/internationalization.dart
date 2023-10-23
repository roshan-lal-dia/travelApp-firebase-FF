import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
  }) =>
      [enText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'y9yxfh7a': {
      'en': 'Search listings...',
      'ta': 'தேடல் பட்டியல்கள்...',
    },
    'o1c3xf84': {
      'en': 'Places',
      'ta': 'இடங்கள்',
    },
    'bhdx19zw': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // Favorites
  {
    'yhpxa9x9': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'w8ai8q29': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'n1jzxf8o': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'yl2wgcux': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'xfdentwd': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'h050w7h1': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'kw141d37': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'l706tz1z': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'oe1yo89k': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'seg9yh38': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'tmzmi2at': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'n6flxgfl': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'doyz5k2x': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'osk1wrrf': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'q3twraqw': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'z0fddni3': {
      'en': 'Title',
      'ta': 'தலைப்பு',
    },
    'kk9e33a7': {
      'en': 'Subtext',
      'ta': 'துணை உரை',
    },
    'orym4wa6': {
      'en': '\$11.00',
      'ta': '\$11.00',
    },
    'n1ywpukc': {
      'en': 'Favorites',
      'ta': 'பிடித்தவை',
    },
    'gs9payij': {
      'en': 'Home',
      'ta': 'வீடு',
    },
  },
  // Miscellaneous
  {
    'ktvarm26': {
      'en': '',
      'ta': '',
    },
    '4ggf6ldo': {
      'en': '',
      'ta': '',
    },
    '3857daji': {
      'en': '',
      'ta': '',
    },
    '9s5z2y5g': {
      'en': '',
      'ta': '',
    },
    'n2flwi5h': {
      'en': '',
      'ta': '',
    },
    'z5avz3ue': {
      'en': '',
      'ta': '',
    },
    'nw4a80e9': {
      'en': '',
      'ta': '',
    },
    'z6efenof': {
      'en': '',
      'ta': '',
    },
    'xswdngmf': {
      'en': '',
      'ta': '',
    },
    '2dvvnpa7': {
      'en': '',
      'ta': '',
    },
    'jlnlj44j': {
      'en': '',
      'ta': '',
    },
    'f3dmotrq': {
      'en': '',
      'ta': '',
    },
    '18tmutec': {
      'en': '',
      'ta': '',
    },
    'ym3n73fz': {
      'en': '',
      'ta': '',
    },
    'lc9cx775': {
      'en': '',
      'ta': '',
    },
    'gs07m2ej': {
      'en': '',
      'ta': '',
    },
    'wlq0kfo0': {
      'en': '',
      'ta': '',
    },
    'ck4lg2c8': {
      'en': '',
      'ta': '',
    },
    'w60l61xr': {
      'en': '',
      'ta': '',
    },
    'nzz3k0uj': {
      'en': '',
      'ta': '',
    },
    'izps8m9m': {
      'en': '',
      'ta': '',
    },
    '95h95kik': {
      'en': '',
      'ta': '',
    },
    'xtaotlty': {
      'en': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
