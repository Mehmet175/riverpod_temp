import 'package:ici_menu/app/base/base_model.dart';
import 'package:ici_menu/app/di/di_order.dart';
import 'package:ici_menu/data/models/user_model.dart';
import 'package:ici_menu/data/network/error_handler.dart';
import 'package:ici_menu/data/source/remote/user_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class UserRepository{
  Future<DataModel<List<UserModel>>> getList();
}

@LazySingleton(as: UserRepository, order: DiOrder.repository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<DataModel<List<UserModel>>> getList() async {
    try {
      final result = await _userRemoteDataSource.getList();
      return DataModel.ok(data: result);
    } catch (e) {
      return DataModel.error(ErrorHandler.handle(e).failure);
    }
  }
}
