import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions {
  static void closeKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static String? validateDefaultTxtField(String? value) {
    if (GetUtils.isBlank(value)!) {
      return "Field is required";
    } else {
      return null;
    }
  }

  static String? validatePasswordTxtField(String? value) {
    if (GetUtils.hasMatch(
      value,
      r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^a-zA-Z\d]).{8,15}$',
    )) {
      return "The password must be at least 8 charactes";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value, String? message) {
    if (GetUtils.isBlank(value)!) {
      return "$message";
    } else if (!GetUtils.isEmail(value!)) {
      return "$message";
    } else {
      return null;
    }
  }

  static String? validateDefaultTxtFieldWithCustomMessage(
      String? value, String? message) {
    if (GetUtils.isBlank(value)!) {
      return "$message";
    } else {
      return null;
    }
  }

  static String? passwordvalidation(String? value, String? message) {
    if (GetUtils.isBlank(value)!) {
      return "$message is required";
    } else if (GetUtils.isLengthLessThan(value, 8)) {
      return "$message must be at least 8 charactors";
      //return " The password must be at least 8 charactes";
    } else {
      return null;
    }
  }

  static String getFlagEmoji(String isoCode) {
    switch (isoCode) {
      case 'ab':
        return '🇦🇧'; // Abkhazian
      case 'aa':
        return '🇦🇫'; // Afar
      case 'af':
        return '🇿🇦'; // Afrikaans
      case 'ak':
        return '🇬🇭'; // Akan
      case 'sq':
        return '🇦🇱'; // Albanian
      case 'am':
        return '🇪🇹'; // Amharic
      case 'ar':
        return '🇸🇦'; // Arabic
      case 'an':
        return '🇪🇸'; // Aragonese
      case 'hy':
        return '🇦🇲'; // Armenian
      case 'as':
        return '🇮🇳'; // Assamese
      case 'av':
        return '🇷🇺'; // Avaric
      case 'ae':
        return '🇮🇷'; // Avestan
      case 'ay':
        return '🇧🇴'; // Aymara
      case 'az':
        return '🇦🇿'; // Azerbaijani
      case 'bm':
        return '🇲🇱'; // Bambara
      case 'ba':
        return '🇷🇺'; // Bashkir
      case 'eu':
        return '🇪🇸'; // Basque
      case 'be':
        return '🇧🇾'; // Belarusian
      case 'bn':
        return '🇧🇩'; // Bengali
      case 'bh':
        return '🇮🇳'; // Bihari Languages
      case 'bi':
        return '🇻🇺'; // Bislama
      case 'bs':
        return '🇧🇦'; // Bosnian
      case 'br':
        return '🇫🇷'; // Breton
      case 'bg':
        return '🇧🇬'; // Bulgarian
      case 'my':
        return '🇲🇲'; // Burmese
      case 'ca':
        return '🇪🇸'; // Catalan
      case 'km':
        return '🇰🇭'; // Central Khmer
      case 'ch':
        return '🇬🇺'; // Chamorro
      case 'ce':
        return '🇷🇺'; // Chechen
      case 'ny':
        return '🇲🇼'; // Chewa (Nyanja)
      case 'zh_Hans':
        return '🇨🇳'; // Chinese (Simplified)
      case 'zh_Hant':
        return '🇨🇳'; // Chinese (Traditional)
      case 'cu':
        return '🇬🇷'; // Church Slavonic
      case 'cv':
        return '🇷🇺'; // Chuvash
      case 'kw':
        return '🇬🇧'; // Cornish
      case 'co':
        return '🇫🇷'; // Corsican
      case 'cr':
        return '🇨🇦'; // Cree
      case 'hr':
        return '🇭🇷'; // Croatian
      case 'cs':
        return '🇨🇿'; // Czech
      case 'da':
        return '🇩🇰'; // Danish
      case 'dv':
        return '🇲🇻'; // Dhivehi
      case 'nl':
        return '🇳🇱'; // Dutch
      case 'dz':
        return '🇧🇹'; // Dzongkha
      case 'en':
        return '🇺🇸'; // English
      case 'eo':
        return '🌐'; // Esperanto
      case 'et':
        return '🇪🇪'; // Estonian
      case 'ee':
        return '🇬🇭'; // Ewe
      case 'fo':
        return '🇫🇴'; // Faroese
      case 'fj':
        return '🇫🇯'; // Fijian
      case 'fi':
        return '🇫🇮'; // Finnish
      case 'fr':
        return '🇫🇷'; // French
      case 'ff':
        return '🇸🇳'; // Fulah
      case 'gd':
        return '🏴󠁧󠁢󠁳󠁣󠁴󠁿'; // Gaelic
      case 'gl':
        return '🇪🇸'; // Galician
      case 'lg':
        return '🇺🇬'; // Ganda
      case 'ka':
        return '🇬🇪'; // Georgian
      case 'de':
        return '🇩🇪'; // German
      case 'el':
        return '🇬🇷'; // Greek
      case 'gn':
        return '🇵🇾'; // Guarani
      case 'gu':
        return '🇮🇳'; // Gujarati
      case 'ht':
        return '🇭🇹'; // Haitian
      case 'ha':
        return '🇳🇬'; // Hausa
      case 'he':
        return '🇮🇱'; // Hebrew
      case 'hz':
        return '🇳🇦'; // Herero
      case 'hi':
        return '🇮🇳'; // Hindi
      case 'ho':
        return '🇵🇬'; // Hiri Motu
      case 'hu':
        return '🇭🇺'; // Hungarian
      case 'is':
        return '🇮🇸'; // Icelandic
      case 'io':
        return '🌐'; // Ido
      case 'ig':
        return '🇳🇬'; // Igbo
      case 'id':
        return '🇮🇩'; // Indonesian
      case 'ia':
        return '🌐'; // Interlingua
      case 'ie':
        return '🌐'; // Interlingue
      case 'iu':
        return '🇨🇦'; // Inuktitut
      case 'ik':
        return '🇺🇸'; // Inupiaq
      case 'ga':
        return '🇮🇪'; // Irish
      case 'it':
        return '🇮🇹'; // Italian
      case 'ja':
        return '🇯🇵'; // Japanese
      case 'jv':
        return '🇮🇩'; // Javanese
      case 'kl':
        return '🇬🇱'; // Kalaallisut
      case 'kn':
        return '🇮🇳'; // Kannada
      case 'kr':
        return '🇳🇬'; // Kanuri
      case 'ks':
        return '🇮🇳'; // Kashmiri
      case 'kk':
        return '🇰🇿'; // Kazakh
      case 'ki':
        return '🇰🇪'; // Kikuyu
      case 'rw':
        return '🇷🇼'; // Kinyarwanda
      case 'ky':
        return '🇰🇬'; // Kirghiz
      case 'kv':
        return '🇷🇺'; // Komi
      case 'kg':
        return '🇨🇩'; // Kongo
      case 'ko':
        return '🇰🇷'; // Korean
      case 'kj':
        return '🇳🇦'; // Kuanyama
      case 'ku':
        return '🇮🇶'; // Kurdish
      case 'lo':
        return '🇱🇦'; // Lao
      case 'la':
        return '🇻🇦'; // Latin
      case 'lv':
        return '🇱🇻'; // Latvian
      case 'li':
        return '🇳🇱'; // Limburgan
      case 'ln':
        return '🇨🇩'; // Lingala
      case 'lt':
        return '🇱🇹'; // Lithuanian
      case 'lu':
        return '🇨🇩'; // Luba-Katanga
      case 'lb':
        return '🇱🇺'; // Luxembourgish
      case 'mk':
        return '🇲🇰'; // Macedonian
      case 'mg':
        return '🇲🇬'; // Malagasy
      case 'ms':
        return '🇲🇾'; // Malay
      case 'ml':
        return '🇮🇳'; // Malayalam
      case 'mt':
        return '🇲🇹'; // Maltese
      case 'gv':
        return '🇮🇲'; // Manx
      case 'mi':
        return '🇳🇿'; // Maori
      case 'mr':
        return '🇮🇳'; // Marathi
      case 'mh':
        return '🇲🇭'; // Marshallese
      case 'mn':
        return '🇲🇳'; // Mongolian
      case 'na':
        return '🇳🇷'; // Nauru
      case 'nv':
        return '🇺🇸'; // Navajo
      case 'nd':
        return '🇿🇼'; // Ndebele, North
      case 'nr':
        return '🇿🇦'; // Ndebele, South
      case 'ng':
        return '🇳🇦'; // Ndonga
      case 'ne':
        return '🇳🇵'; // Nepali
      case 'se':
        return '🇳🇴'; // Northern Sami
      case 'no':
        return '🇳🇴'; // Norwegian
      case 'nn':
        return '🇳🇴'; // Norwegian Nynorsk
      case 'oc':
        return '🇫🇷'; // Occitan
      case 'oj':
        return '🇨🇦'; // Ojibwa
      case 'or':
        return '🇮🇳'; // Oriya
      case 'om':
        return '🇪🇹'; // Oromo
      case 'os':
        return '🇷🇺'; // Ossetian
      case 'pi':
        return '🇮🇳'; // Pali
      case 'pa':
        return '🇮🇳'; // Panjabi
      case 'fa':
        return '🇮🇷'; // Persian
      case 'pl':
        return '🇵🇱'; // Polish
      case 'pt':
        return '🇵🇹'; // Portuguese
      case 'ps':
        return '🇵🇰'; // Pushto
      case 'qu':
        return '🇵🇪'; // Quechua
      case 'ro':
        return '🇷🇴'; // Romanian
      case 'rm':
        return '🇨🇭'; // Romansh
      case 'rn':
        return '🇧🇮'; // Rundi
      case 'ru':
        return '🇷🇺'; // Russian
      case 'sm':
        return '🇼🇸'; // Samoan
      case 'sg':
        return '🇨🇫'; // Sango
      case 'sa':
        return '🇮🇳'; // Sanskrit
      case 'sc':
        return '🇮🇹'; // Sardinian
      case 'sr':
        return '🇷🇸'; // Serbian
      case 'sn':
        return '🇿🇼'; // Shona
      case 'ii':
        return '🇨🇳'; // Sichuan Yi
      case 'sd':
        return '🇵🇰'; // Sindhi
      case 'si':
        return '🇱🇰'; // Sinhala
      case 'sk':
        return '🇸🇰'; // Slovak
      case 'sl':
        return '🇸🇮'; // Slovenian
      case 'so':
        return '🇸🇴'; // Somali
      case 'st':
        return '🇱🇸'; // Sotho, Southern
      case 'es':
        return '🇪🇸'; // Spanish
      case 'su':
        return '🇮🇩'; // Sundanese
      case 'sw':
        return '🇹🇿'; // Swahili
      case 'ss':
        return '🇸🇿'; // Swati
      case 'sv':
        return '🇸🇪'; // Swedish
      case 'tl':
        return '🇵🇭'; // Tagalog
      case 'ty':
        return '🇵🇫'; // Tahitian
      case 'tg':
        return '🇹🇯'; // Tajik
      case 'ta':
        return '🇱🇰'; // Tamil
      case 'tt':
        return '🇷🇺'; // Tatar
      case 'te':
        return '🇮🇳'; // Telugu
      case 'th':
        return '🇹🇭'; // Thai
      case 'bo':
        return '🇨🇳'; // Tibetan
      case 'ti':
        return '🇪🇷'; // Tigrinya
      case 'to':
        return '🇹🇴'; // Tonga (Tonga Islands)
      case 'ts':
        return '🇿🇦'; // Tsonga
      case 'tn':
        return '🇧🇼'; // Tswana
      case 'tr':
        return '🇹🇷'; // Turkish
      case 'tk':
        return '🇹🇲'; // Turkmen
      case 'tw':
        return '🇬🇭'; // Twi
      case 'ug':
        return '🇨🇳'; // Uighur
      case 'uk':
        return '🇺🇦'; // Ukrainian
      case 'ur':
        return '🇵🇰'; // Urdu
      case 'uz':
        return '🇺🇿'; // Uzbek
      case 've':
        return '🇿🇦'; // Venda
      case 'vi':
        return '🇻🇳'; // Vietnamese
      case 'vo':
        return '🌐'; // Volapük
      case 'wa':
        return '🇧🇪'; // Walloon
      case 'cy':
        return '🇬🇧'; // Welsh
      case 'fy':
        return '🇳🇱'; // Western Frisian
      case 'wo':
        return '🇸🇳'; // Wolof
      case 'xh':
        return '🇿🇦'; // Xhosa
      case 'yi':
        return '🇮🇱'; // Yiddish
      case 'yo':
        return '🇳🇬'; // Yoruba
      case 'za':
        return '🇨🇳'; // Zhuang
      case 'zu':
        return '🇿🇦'; // Zulu
      default:
        return ''; // Empty string if no flag is found
    }
  }
}
