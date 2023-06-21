import 'package:dio/dio.dart';
import 'package:ici_menu/app/constants.dart';
import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
@LazySingleton(order: DiOrder.appServiceClient)
abstract class AppServiceClient {
  @FactoryMethod()
  factory AppServiceClient(Dio dio) = _AppServiceClient;


  @GET("/users")
  Future<List<UserModel>> getUserList();
}