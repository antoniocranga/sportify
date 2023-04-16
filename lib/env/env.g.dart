// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const appName = 'Sportify';
  static const List<int> _enviedkeyapiKey = [
    352828438,
    971913069,
    3570067138,
    3946062543,
    505621427,
    1729807783,
    2580542616,
    38224082,
    139975006,
    723753767,
    3396966797,
    103769791,
    3233948551,
    3048715645,
    2750078820,
    713681671,
    3640123495,
    347106297,
    2738148859,
    2059423948,
    2705797008,
    664387829,
    1594737284,
    4004995168,
    3312657017,
    3185072680,
    2063731095,
    1901280948,
    2265011874,
    533152631,
    2272313840,
    2946147969
  ];
  static const List<int> _envieddataapiKey = [
    352828530,
    971912972,
    3570067191,
    3946062583,
    505621462,
    1729807760,
    2580542632,
    38224055,
    139975020,
    723753749,
    3396966837,
    103769821,
    3233948642,
    3048715599,
    2750078803,
    713681766,
    3640123476,
    347106251,
    2738148808,
    2059423995,
    2705797107,
    664387788,
    1594737382,
    4004995155,
    3312656923,
    3185072715,
    2063731106,
    1901280897,
    2265011867,
    533152533,
    2272313793,
    2946148069
  ];
  static final String apiKey = String.fromCharCodes(
    List.generate(_envieddataapiKey.length, (i) => i, growable: false)
        .map((i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i])
        .toList(growable: false),
  );
  static const footballHost = 'https://v3.football.api-sports.io';
  static const basketballHost = 'https://v1.basketball.api-sports.io';
  static const baseballHost = 'https://v1.baseball.api-sports.io';
}
