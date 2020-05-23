import 'package:flutter/cupertino.dart';

class LocalDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const LocalDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalDelegate old) => false;
}
