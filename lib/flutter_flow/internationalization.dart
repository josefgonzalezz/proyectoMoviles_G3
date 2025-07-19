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
      'es': 'Cerrar Sesione',
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
    'jvi08s0m': {
      'es': 'first name',
      'en': '',
    },
    '3mq9xfe6': {
      'es': 'Field is required',
      'en': '',
    },
    '6l4hi57r': {
      'es': 'Solo letras, sin espacios',
      'en': '',
    },
    'tonpoxsm': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'luxakmdn': {
      'es': 'Last Name',
      'en': '',
    },
    'l0835q4g': {
      'es': 'second name',
      'en': '',
    },
    'g517s1l8': {
      'es': 'Field is required',
      'en': '',
    },
    '6hnqzjx2': {
      'es': 'solo letras, sin espacios',
      'en': '',
    },
    '66mdlr1j': {
      'es': 'Please choose an option from the dropdown',
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
    'qvyivhkh': {
      'es': 'email is required',
      'en': '',
    },
    'tho6534o': {
      'es': 'Se necesita un gmail valido',
      'en': '',
    },
    '82lu67s4': {
      'es': 'Please choose an option from the dropdown',
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
    'wt7zvajq': {
      'es': 'password is required',
      'en': '',
    },
    'hvzt9e2e': {
      'es': 'Al menos 7 caracteres',
      'en': '',
    },
    'p7ru9enx': {
      'es': 'Please choose an option from the dropdown',
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
    '3qx1g3vo': {
      'es': 'confirm password is required',
      'en': '',
    },
    '1kidjqb9': {
      'es': 'Please choose an option from the dropdown',
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
    'xcwjl3bn': {
      'es': 'mm/dd/yyyy is required',
      'en': '',
    },
    'ccp16hbt': {
      'es': 'Please choose an option from the dropdown',
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
    '4qvbzs6l': {
      'es': 'Ingrese un limite valido ',
      'en': '',
    },
    'qvu0l4pn': {
      'es': 'Please choose an option from the dropdown',
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
    'a4sgtyes': {
      'es': 'Field is required',
      'en': '',
    },
    'swbbi7k1': {
      'es': 'At least 10 characters',
      'en': '',
    },
    'gp92n0n3': {
      'es': 'Se require un gmail valido',
      'en': '',
    },
    'd15qvjtk': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2ieg5bx5': {
      'es': 'Password',
      'en': '',
    },
    'y5ltk7y4': {
      'es': 'Field is required',
      'en': '',
    },
    'qn3i74uc': {
      'es': 'At least 7 characters',
      'en': '',
    },
    'a6ectxlh': {
      'es': 'Please choose an option from the dropdown',
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
    'ccizain2': {
      'es': 'Hello World',
      'en': '',
    },
    'qsl01b1f': {
      'es': 'Hello World',
      'en': '',
    },
    'i088pzen': {
      'es': 'Hello Worldd',
      'en': '',
    },
    'rel62tax': {
      'es': 'Hello World',
      'en': '',
    },
    'kncoqicn': {
      'es': 'Hello World',
      'en': '',
    },
    '22gqk8vb': {
      'es': 'Hello World',
      'en': '',
    },
    '5l7h4d8t': {
      'es': 'Hello World',
      'en': '',
    },
    'giwumhw6': {
      'es': 'Hello World',
      'en': '',
    },
    '02vjg8ug': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // verGastos
  {
    'it8qb8iy': {
      'es': 'Historial de gastos',
      'en': '',
    },
    'w7919jea': {
      'es': 'Hello World',
      'en': '',
    },
    'qd7gsjy6': {
      'es': 'Hello World',
      'en': '',
    },
    'gp31xa28': {
      'es': 'Hello World',
      'en': '',
    },
    'a5oatey9': {
      'es': 'Home',
      'en': '',
    },
  },
  // verGrafica
  {
    'kvxim5vm': {
      'es': 'Page Title',
      'en': '',
    },
    'fg3o19et': {
      'es': 'Home',
      'en': '',
    },
  },
  // agregarTransaccion
  {
    '2b58o5t2': {
      'es': 'Balance',
      'en': '',
    },
    'lr03dnxl': {
      'es': '₡69',
      'en': '',
    },
    'g7sh7am4': {
      'es': 'Agregar Dinero',
      'en': '',
    },
    '1w6ootfy': {
      'es': 'Transferir gasto',
      'en': '',
    },
    'vqx83jkg': {
      'es': 'Ahorro',
      'en': '',
    },
    '34rcdc96': {
      'es': '₡2000',
      'en': '',
    },
    'ndd14nlh': {
      'es': 'Comida',
      'en': '',
    },
    'opkbqz8f': {
      'es': '₡5000',
      'en': '',
    },
    '615hj671': {
      'es': 'Entretenimiento',
      'en': '',
    },
    '3ctxjpnk': {
      'es': '₡3700',
      'en': '',
    },
    'oahdg5iu': {
      'es': 'Otros',
      'en': '',
    },
    'tkm6m4w2': {
      'es': '₡3500',
      'en': '',
    },
    'swnu5y77': {
      'es': 'Transactions',
      'en': '',
    },
    '2cisphuj': {
      'es': 'Almuerzo',
      'en': '',
    },
    'hyrza7mn': {
      'es': 'Today,12:32pm',
      'en': '',
    },
    'md94p8xb': {
      'es': '₡5000',
      'en': '',
    },
    'uy48vlch': {
      'es': 'Spotify Suscription',
      'en': '',
    },
    '3ho8urpr': {
      'es': 'Today, 1:22pm',
      'en': '',
    },
    'z82b3sv7': {
      'es': '₡3700',
      'en': '',
    },
    'm2huu51h': {
      'es': 'Uber',
      'en': '',
    },
    'nk22jnzr': {
      'es': 'Today, 4:52pm',
      'en': '',
    },
    '8faq7p8v': {
      'es': '₡3500',
      'en': '',
    },
    '0aywtp2a': {
      'es': 'Ahorro',
      'en': '',
    },
    'qhx6k5he': {
      'es': 'Today, 7:42pm',
      'en': '',
    },
    'dsgym5ny': {
      'es': '₡2000',
      'en': '',
    },
    '8kesd4c6': {
      'es': 'Agregar Transaccion',
      'en': '',
    },
    'z3o56po1': {
      'es': 'Home',
      'en': '',
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
