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
    'jvi08s0m': {
      'es': 'first name',
      'en': '',
    },
    '3mq9xfe6': {
      'es': 'Field is required',
      'en': '',
    },
    '90o66i06': {
      'es': 'Minimo tres letras',
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
      'es': 'last name',
      'en': '',
    },
    'g517s1l8': {
      'es': 'Field is required',
      'en': '',
    },
    'o21x0tpj': {
      'es': 'Minimos tres letras',
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
    'aga3dotx': {
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
    'z7xlf24p': {
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
    'u0etwt5s': {
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
    'n3h6adns': {
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
    '6n4df23b': {
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
    'c1in816y': {
      'es': 'Field is required',
      'en': '',
    },
    'qn3i74uc': {
      'es': 'At least 7 characters',
      'en': '',
    },
    '8e70lsle': {
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
    'ccizain2': {
      'es': 'Datos Personales',
      'en': '',
    },
    'qsl01b1f': {
      'es':
          'Aquí podrás observar todos tus datos personales y podrás\nmodificar el gasto semanal previamente configurado\nal crear tu cuenta ',
      'en': '',
    },
    'i088pzen': {
      'es': 'Gastos Diarios',
      'en': '',
    },
    'rel62tax': {
      'es': 'Ingresa los gastos que \nrealices a lo largo de \nla semana',
      'en': '',
    },
    'kncoqicn': {
      'es': 'Historial de Gastos',
      'en': '',
    },
    '22gqk8vb': {
      'es': 'Ingresa los gatos que \nrealices a lo largo\nde la semana ',
      'en': '',
    },
    '5l7h4d8t': {
      'es': 'Gastos en Grafíca',
      'en': '',
    },
    'giwumhw6': {
      'es': 'Ingresa los gastos que \nrealices a lo largo\nde la semana ',
      'en': '',
    },
    '0v6g4fod': {
      'es': 'Bienvenido/a ',
      'en': '',
    },
    '02vjg8ug': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // verGastos
  {
    'prr2c6y6': {
      'es': 'Historial de Gastos:',
      'en': '',
    },
    'qx7iqh3n': {
      'es': '/',
      'en': '',
    },
    'wso1dl8b': {
      'es': '/',
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
    'wzq0s2yi': {
      'es': 'Home',
      'en': '',
    },
  },
  // ingresarGasto
  {
    'ic81wd5c': {
      'es': 'Ingresar Gasto',
      'en': '',
    },
    'w8vnkp0s': {
      'es': 'Nombre de compra realizada: ',
      'en': '',
    },
    'd13irgol': {
      'es': 'compra',
      'en': '',
    },
    'z8e771bv': {
      'es': 'Categoría: ',
      'en': '',
    },
    'g7d83wfx': {
      'es': 'descripcion',
      'en': '',
    },
    'vxnueb8m': {
      'es': 'Costo:',
      'en': '',
    },
    '04nwp0u5': {
      'es': 'costo',
      'en': '',
    },
    'bww2i052': {
      'es': 'El costo es requerido',
      'en': '',
    },
    'ckmej7m4': {
      'es': 'Solo se permite numeros validos',
      'en': '',
    },
    '3sn4deaq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'b3yy7nm7': {
      'es': 'Comentario adicional:',
      'en': '',
    },
    'iaxxto9m': {
      'es': 'comentario',
      'en': '',
    },
    'ly2qmp43': {
      'es': 'Ingresar Gasto',
      'en': '',
    },
    'enc84gez': {
      'es': 'Home',
      'en': '',
    },
  },
  // personalInformation
  {
    '9nmu0u0t': {
      'es': 'Mi perfil',
      'en': '',
    },
    'p81jzj91': {
      'es': 'Información de mi cuenta',
      'en': '',
    },
    '8yoxv88x': {
      'es': 'Usuario:',
      'en': '',
    },
    'kv6c7loc': {
      'es': 'Límite de Gasto:',
      'en': '',
    },
    'sva2s718': {
      'es': 'editar',
      'en': '',
    },
    'lsbkg8er': {
      'es': 'Contraseña:',
      'en': '',
    },
    'pr7nerae': {
      'es': 'editar',
      'en': '',
    },
    'qmb6dd7m': {
      'es': 'Historial de gastos:',
      'en': '',
    },
    'ekgw8hmf': {
      'es': 'Ir ahora',
      'en': '',
    },
    'fdrums13': {
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
