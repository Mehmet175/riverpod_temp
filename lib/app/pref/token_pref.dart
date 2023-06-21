import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/app/pref/base_pref/string_pref.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(order: DiOrder.tokenPref)
class TokenPref extends StringPref {
  @override
  String get prefKey => "TokenPref";
}
