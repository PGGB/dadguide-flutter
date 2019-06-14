import 'package:preferences/preferences.dart';

// TODO: probably can combine this into a more concrete class that wraps this stuff
// TODO: should add something to enforce good values in prefInit

enum LangPref {
  english,
  japanese,
  korean,
}

final langPrefValues = [
  LangPref.english.index,
  LangPref.japanese.index,
  LangPref.korean.index,
];

final langPrefDisplayValues = [
  langToString(LangPref.english),
  langToString(LangPref.japanese),
  langToString(LangPref.korean),
];

String langToString(LangPref pref) {
  switch (pref) {
    case LangPref.english:
      return 'English';
    case LangPref.japanese:
      return 'Japanese';
    case LangPref.korean:
      return 'Korean';
    default:
      throw 'Unexpected enum value: ${pref.index}';
  }
}

int langToValue(LangPref pref) {
  return pref.index;
}

void preferenceInit() async {
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({
    'info_language': langToValue(LangPref.english),
    'events_hide_closed': true,
    'events_show_red': true,
    'events_show_blue': true,
    'events_show_green': true,
  });
}
