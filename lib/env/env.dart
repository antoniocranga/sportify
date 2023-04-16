import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: "APP_NAME")
  static const appName = _Env.appName;

  @EnviedField(varName: "API_KEY", obfuscate: true)
  static String apiKey = _Env.apiKey;

  @EnviedField(varName: "FOOTBALL_HOST")
  static const footballHost = _Env.footballHost;

  @EnviedField(varName: "BASKETBALL_HOST")
  static const basketballHost = _Env.basketballHost;

  @EnviedField(varName: "BASEBALL_HOST")
  static const baseballHost = _Env.baseballHost;
}
