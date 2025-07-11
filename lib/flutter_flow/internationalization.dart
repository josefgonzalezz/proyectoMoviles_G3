import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignOutPage
  {
    '46q6z8c7': {
      'es': 'Cerrar Sesion',
      'en': 'SignIn out',
    },
    '14elcxc5': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // SignUpPage
  {
    '4q8mxllv': {
      'es': 'Create an Account',
      'en': '',
    },
    'mos7oxca': {
      'es': 'First name',
      'en': '',
    },
    'luxakmdn': {
      'es': 'Last Name',
      'en': '',
    },
    'r364rim4': {
      'es': 'Email',
      'en': '',
    },
    '6rer3psr': {
      'es': 'email',
      'en': '',
    },
    '08a40y4j': {
      'es': 'Password',
      'en': '',
    },
    '56w2v43q': {
      'es': 'password',
      'en': '',
    },
    'vnfqp6oy': {
      'es': 'Confirm password',
      'en': '',
    },
    'ieccji7b': {
      'es': 'confirm password',
      'en': '',
    },
    'fqcfo5jf': {
      'es': 'Birthdate',
      'en': '',
    },
    'omqxmdvx': {
      'es': 'mm/dd/yyyy',
      'en': '',
    },
    'c0zwoku9': {
      'es': 'Weekly limit:',
      'en': '',
    },
    'fygv3fdo': {
      'es': 'Weekly limit',
      'en': '',
    },
    '3281meg8': {
      'es': 'Sign In',
      'en': '',
    },
    'k68z08j7': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // personalInformation
  {
    'l57d0myz': {
      'es': 'Page Title',
      'en': '',
    },
    '2rk2kf7p': {
      'es': 'Hello World',
      'en': '',
    },
    'jv1yiomm': {
      'es': 'Home',
      'en': '',
    },
  },
  // SignInPage
  {
    'mdilx0yg': {
      'es': 'Sign In',
      'en': '',
    },
    '49altw2n': {
      'es': 'Access your account by entering your email and password.',
      'en': '',
    },
    '4mpmcarp': {
      'es': 'Email',
      'en': '',
    },
    '2ieg5bx5': {
      'es': 'Password',
      'en': '',
    },
    '4xfcxjjl': {
      'es': 'Sign In',
      'en': '',
    },
    'ljr3xbzk': {
      'es': 'First time here?  ',
      'en': '',
    },
    'ocp2656p': {
      'es': 'CREATE AN ACCOUNT',
      'en': '',
    },
    'gijbuyd3': {
      'es': 'Casa',
      'en': 'Home',
    },
  },
  // HomePage
  {
    'bmenjvev': {
      'es': 'Bienvenid@s a la aplicacion gastos ',
      'en': 'Home',
    },
    'h0ihifbp': {
      'es': 'Hello World',
      'en': '',
    },
    'os8doy3t': {
      'es': 'Hello World',
      'en': '',
    },
    'n7at5gox': {
      'es': 'Hello Worldd',
      'en': '',
    },
    'ua4nyoa2': {
      'es': 'Hello World',
      'en': '',
    },
    'gn7daic8': {
      'es': 'Hello World',
      'en': '',
    },
    'm0v6etob': {
      'es': 'Hello World',
      'en': '',
    },
    'vks1r6if': {
      'es': 'Hello World',
      'en': '',
    },
    'qhsf4a3m': {
      'es': 'Hello World',
      'en': '',
    },
    '02vjg8ug': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    '3ow09nyd': {
      'es': '',
      'en': '',
    },
    '75r20m7v': {
      'es': '',
      'en': '',
    },
    'ys30se44': {
      'es': '',
      'en': '',
    },
    'ua4enz9w': {
      'es': '',
      'en': '',
    },
    'p6bmd4pw': {
      'es': '',
      'en': '',
    },
    '3gc3t3s4': {
      'es': '',
      'en': '',
    },
    'xeo7x566': {
      'es': '',
      'en': '',
    },
    'gm04l4ww': {
      'es': '',
      'en': '',
    },
    'dvyihl1b': {
      'es': '',
      'en': '',
    },
    'ueq3c2l6': {
      'es': '',
      'en': '',
    },
    'uad9ayfs': {
      'es': '',
      'en': '',
    },
    'amf6yk4u': {
      'es': '',
      'en': '',
    },
    '8rata7yf': {
      'es': '',
      'en': '',
    },
    '8kq6y555': {
      'es': '',
      'en': '',
    },
    'j3eg7cgd': {
      'es': '',
      'en': '',
    },
    '83tx0u4r': {
      'es': '',
      'en': '',
    },
    'yv3u8ncp': {
      'es': '',
      'en': '',
    },
    'a5iuypdz': {
      'es': '',
      'en': '',
    },
    'c2blyev4': {
      'es': '',
      'en': '',
    },
    'bomhir6s': {
      'es': '',
      'en': '',
    },
    'qwowm4uq': {
      'es': '',
      'en': '',
    },
    'y0oesm55': {
      'es': '',
      'en': '',
    },
    'l33ruryl': {
      'es': '',
      'en': '',
    },
    'eils1u4t': {
      'es': '',
      'en': '',
    },
    'rmnf9ca1': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
