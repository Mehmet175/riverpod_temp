import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ici_menu/app/base/base_model.dart';
import 'package:ici_menu/data/models/user_model.dart';
import 'package:ici_menu/data/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserViewModel extends StateNotifier<UserPageState> {
  UserViewModel(this._userRepository)
      : super(
          UserPageState(StateModel<List<UserModel>>.loading()),
        );

  final UserRepository _userRepository;

  Future<void> getList() async {
    _userRepository.getList().then((value) {
      state = state.copyWith(userList: value.toStateModel());
    });
  }
}

class UserPageState extends Equatable {
  const UserPageState(this.userList);
  final StateModel<List<UserModel>> userList;

  @override
  List<Object?> get props => [userList];

  UserPageState copyWith({
    StateModel<List<UserModel>>? userList,
  }) {
    return UserPageState(
      userList ?? this.userList,
    );
  }
}
