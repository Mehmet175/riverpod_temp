import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ici_menu/app/di/di.config.dart';
import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/data/network/dio_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  @LazySingleton(order: DiOrder.sharedPreferences)
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @LazySingleton(order: DiOrder.dio)
  Future<Dio> get getDio => getIt<DioFactory>().getDio();

}

Future<void> resetInstance() async {
  await getIt.reset(dispose: true);
  await configureDependencies();
}

