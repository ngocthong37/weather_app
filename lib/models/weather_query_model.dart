// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Weather> weatherFromJson(String str) => List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

String weatherToJson(List<Weather> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weather {
    Weather({
        required this.name,
        required this.localNames,
        required this.lat,
        required this.lon,
        required this.country,
        required this.state,
    });

    String name;
    LocalNames localNames;
    double lat;
    double lon;
    String country;
    String state;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        name: json["name"],
        localNames: json["local_names"] ?? LocalNames.fromJson(json["local_names"]),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "local_names": localNames == null ? null : localNames.toJson(),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
    };
}

class LocalNames {
    LocalNames({
        required this.fa,
        required this.vi,
        required this.zh,
        required this.th,
        required this.ar,
        required this.he,
        required this.uk,
        required this.sr,
        required this.bg,
        required this.ko,
        required this.ru,
        required this.lt,
        required this.ur,
        required this.ja,
        required this.en,
        required this.ascii,
        required this.featureName,
    });

    String fa;
    String vi;
    String zh;
    String th;
    String ar;
    String he;
    String uk;
    String sr;
    String bg;
    String ko;
    String ru;
    String lt;
    String ur;
    String ja;
    String en;
    String ascii;
    String featureName;

    factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
        fa: json["fa"] == null ? null : json["fa"],
        vi: json["vi"],
        zh: json["zh"],
        th: json["th"] == null ? null : json["th"],
        ar: json["ar"] == null ? null : json["ar"],
        he: json["he"] == null ? null : json["he"],
        uk: json["uk"] == null ? null : json["uk"],
        sr: json["sr"] == null ? null : json["sr"],
        bg: json["bg"] == null ? null : json["bg"],
        ko: json["ko"] == null ? null : json["ko"],
        ru: json["ru"] == null ? null : json["ru"],
        lt: json["lt"] == null ? null : json["lt"],
        ur: json["ur"] == null ? null : json["ur"],
        ja: json["ja"],
        en: json["en"],
        ascii: json["ascii"] == null ? null : json["ascii"],
        featureName: json["feature_name"] == null ? null : json["feature_name"],
    );

    Map<String, dynamic> toJson() => {
        "fa": fa == null ? null : fa,
        "vi": vi,
        "zh": zh,
        "th": th == null ? null : th,
        "ar": ar == null ? null : ar,
        "he": he == null ? null : he,
        "uk": uk == null ? null : uk,
        "sr": sr == null ? null : sr,
        "bg": bg == null ? null : bg,
        "ko": ko == null ? null : ko,
        "ru": ru == null ? null : ru,
        "lt": lt == null ? null : lt,
        "ur": ur == null ? null : ur,
        "ja": ja,
        "en": en,
        "ascii": ascii == null ? null : ascii,
        "feature_name": featureName == null ? null : featureName,
    };
}
