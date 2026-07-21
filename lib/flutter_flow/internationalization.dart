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

  static List<String> languages() => ['en', 'nl', 'fr'];

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
    String? nlText = '',
    String? frText = '',
  }) =>
      [enText, nlText, frText][languageIndex] ?? '';

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
  // signIn
  {
    '2qkf4ogm': {
      'en': 'Welcome Back!',
      'fr': '',
      'nl': '',
    },
    '6wtmg81a': {
      'en': 'Use the form below to access your account.',
      'fr': '',
      'nl': '',
    },
    '9w10nc7f': {
      'en': 'Email Address',
      'fr': '',
      'nl': '',
    },
    'k685glh5': {
      'en': 'Enter your email here...',
      'fr': '',
      'nl': '',
    },
    '3ifflaxp': {
      'en': 'Password',
      'fr': '',
      'nl': '',
    },
    'cluflp7v': {
      'en': 'Enter your email here...',
      'fr': '',
      'nl': '',
    },
    'sbuxfgic': {
      'en': 'Forgot Password?',
      'fr': '',
      'nl': '',
    },
    'mri7qfge': {
      'en': 'Sign In',
      'fr': '',
      'nl': '',
    },
    '7jcpk6av': {
      'en': 'Use a social platform to continue',
      'fr': '',
      'nl': '',
    },
    'nsvtt11e': {
      'en': 'Signup in Google',
      'fr': '',
      'nl': '',
    },
    '3x6bz5r2': {
      'en': 'Don\'t have an account?',
      'fr': '',
      'nl': '',
    },
    'k45mojza': {
      'en': 'Create Account',
      'fr': '',
      'nl': '',
    },
    'tyhdawyj': {
      'en': 'Home',
      'fr': '',
      'nl': '',
    },
  },
  // signUp
  {
    'cdtpnl3t': {
      'en': 'Get Started',
      'fr': '',
      'nl': '',
    },
    '306l4pl5': {
      'en': 'Create an account by using the form below.',
      'fr': '',
      'nl': '',
    },
    'zpq1ntyd': {
      'en': 'Email Address',
      'fr': '',
      'nl': '',
    },
    'pnwxoevu': {
      'en': 'Enter your email here...',
      'fr': '',
      'nl': '',
    },
    'krqie67u': {
      'en': 'Password',
      'fr': '',
      'nl': '',
    },
    'kdn2q3dm': {
      'en': 'Enter your email here...',
      'fr': '',
      'nl': '',
    },
    'ev5qxli8': {
      'en': 'Sign Up',
      'fr': '',
      'nl': '',
    },
    '0zttimng': {
      'en': 'Use a social platform to continue',
      'fr': '',
      'nl': '',
    },
    'whbmlc3d': {
      'en': 'Signup in  Google',
      'fr': '',
      'nl': '',
    },
    '6oyastb4': {
      'en': 'Already have an account?',
      'fr': '',
      'nl': '',
    },
    '4xrgetzf': {
      'en': 'Login',
      'fr': '',
      'nl': '',
    },
    'vx0t9ra4': {
      'en': 'Home',
      'fr': '',
      'nl': '',
    },
  },
  // forgotPassword
  {
    '1ezh869x': {
      'en': 'Forgot Password',
      'fr': '',
      'nl': '',
    },
    'nn5l4rs8': {
      'en': 'Forgot Password',
      'fr': '',
      'nl': '',
    },
    'p0vbcj0m': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fr': '',
      'nl': '',
    },
    'qo4l59ir': {
      'en': 'Your email',
      'fr': '',
      'nl': '',
    },
    'fz22omke': {
      'en': 'Enter your email to recieve a linke...',
      'fr': '',
      'nl': '',
    },
    'adv3rmu4': {
      'en': 'Send Reset Link',
      'fr': '',
      'nl': '',
    },
    'oydo7ya4': {
      'en': 'Home',
      'fr': '',
      'nl': '',
    },
  },
  // HomePage
  {
    'chrjdn9d': {
      'en': '•',
      'fr': '',
      'nl': '',
    },
  },
  // profilePage
  {
    'qhroc4gn': {
      'en': 'Account',
      'fr': '',
      'nl': '',
    },
    'qu7wgv0f': {
      'en': 'Country',
      'fr': '',
      'nl': '',
    },
    'wg7je8z1': {
      'en': 'Edit Profile',
      'fr': '',
      'nl': '',
    },
    'qznidc3j': {
      'en': 'General',
      'fr': '',
      'nl': '',
    },
    'tjalvw9s': {
      'en': 'Support',
      'fr': '',
      'nl': '',
    },
    'mzi4y722': {
      'en': 'Terms of Service',
      'fr': '',
      'nl': '',
    },
    '64q4vifg': {
      'en': 'Invite Friends',
      'fr': '',
      'nl': '',
    },
    '74no3l24': {
      'en': 'Light Mode',
      'fr': '',
      'nl': '',
    },
    'r3zed5s0': {
      'en': 'Dark Mode',
      'fr': '',
      'nl': '',
    },
    '3h0m8upm': {
      'en': 'My Profile',
      'fr': '',
      'nl': '',
    },
    '5i7wbrdu': {
      'en': '•',
      'fr': '',
      'nl': '',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'fr': '',
      'nl': '',
    },
    'upni203i': {
      'en': 'Password',
      'fr': '',
      'nl': '',
    },
    'x5hsigqw': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '9wy77t9v': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'woezzutp': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '2bj20mi4': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'oztjr3ws': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'hc87g50d': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'e368pegn': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'yv65a6i5': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'fr': '',
      'nl': '',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'fr': '',
      'nl': '',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'fr': '',
      'nl': '',
    },
    'jv85czds': {
      'en': 'Closed',
      'fr': '',
      'nl': '',
    },
    'swt4x372': {
      'en': 'Completed',
      'fr': '',
      'nl': '',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'fr': '',
      'nl': '',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'fr': '',
      'nl': '',
    },
    'lted0txl': {
      'en': 'All',
      'fr': '',
      'nl': '',
    },
    'm6iqz668': {
      'en': 'Pending',
      'fr': '',
      'nl': '',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'fr': '',
      'nl': '',
    },
    'txjoh349': {
      'en': 'Calling',
      'fr': '',
      'nl': '',
    },
    'qube3xir': {
      'en': 'All',
      'fr': '',
      'nl': '',
    },
    'mxalfkji': {
      'en': '50%',
      'fr': '',
      'nl': '',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'fr': '',
      'nl': '',
    },
    'poegde7v': {
      'en': 'Notifications',
      'fr': '',
      'nl': '',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'fr': '',
      'nl': '',
    },
    'bqjgqich': {
      'en': 'Male',
      'fr': '',
      'nl': '',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'fr': '',
      'nl': '',
    },
    'qtchqf19': {
      'en': 'Other',
      'fr': '',
      'nl': '',
    },
    '82a75t5n': {
      'en': 'Design',
      'fr': '',
      'nl': '',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'fr': '',
      'nl': '',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'fr': '',
      'nl': '',
    },
    '3wjkerx7': {
      'en': 'Management',
      'fr': '',
      'nl': '',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'fr': '',
      'nl': '',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'fr': '',
      'nl': '',
    },
    '2rhm2suy': {
      'en': 'Design',
      'fr': '',
      'nl': '',
    },
    'dkawmhuq': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    'oq8d6g00': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '40a6kmks': {
      'en': 'Button',
      'fr': '',
      'nl': '',
    },
    '3rlvxqwb': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'tid8sr39': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '867gomk0': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'xlq0u9sn': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'cigtlknu': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '7p3njleu': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '4dptqi9c': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '593qzm6z': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'tx0197t3': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'ew4kwngy': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'f8ktll1o': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'nlxoomok': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'reu1rov5': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'movivv2o': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'd3rrubd2': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '5vv91i4g': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    't8yv3nxk': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    '2gnn9k1f': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'pqlm0uv5': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'snbwxdbk': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'ngzoot0n': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'nmxgdlhv': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'vz0na9mc': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'rpbfh7j6': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'qc9hsxal': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'exqsikvu': {
      'en': '',
      'fr': '',
      'nl': '',
    },
    'mgykjemq': {
      'en': '',
      'fr': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
