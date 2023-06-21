import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/data/models/user_model.dart';
import 'package:ici_menu/data/network/app_api.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getList();
}

@LazySingleton(as: UserRemoteDataSource, order: DiOrder.remoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final AppServiceClient _appServiceClient;
  UserRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<List<UserModel>> getList() {
    return _appServiceClient.getUserList();
  }
}
