import 'package:get/get.dart';
import 'package:resk_you_mobile/translations/fr.dart';
import 'package:resk_you_mobile/translations/en.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'fr': fr
  };
}