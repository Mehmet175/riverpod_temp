import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ici_menu/app/base/base_model.dart';
import 'package:ici_menu/app/base/base_view.dart';
import 'package:ici_menu/app/common_view/error_state_widget.dart';
import 'package:ici_menu/app/resource/value_manager.dart';
import 'package:ici_menu/presentation/user/user_view_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final tempImageUrl = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel, UserPageState>(
      onViewAndViewModelReady: (watch, read, state) => read.getList(),
      onPageBuild: (watch, read, state) => Scaffold(
        appBar: AppBar(
          title: const Text('User Page'),
        ),
        body: _body(watch, read, state),
      ),
    );
  }

  Widget _body(
    UserViewModel watch,
    UserViewModel read,
    UserPageState state,
  ) {
    return state.userList.getScreenWidgetD(
      context,
      errorWidget: (failure) => ErrorStateWidget(
        errorMessage: failure.serverMessage ?? failure.message.tr(),
        buttonOnClick: () {
          read.getList();
        },
      ),
      okWidget: (data) => _bodyContent(watch, read, state),
    );
  }

  Widget _bodyContent(
    UserViewModel watch,
    UserViewModel read,
    UserPageState state,
  ) {
    return ListView.builder(
        itemCount: state.userList.data!.length,
        padding: const EdgeInsets.all(AppSize.s20),
        itemBuilder: (context, index) {
          final item = state.userList.data![index];
          return Container(
            margin: const EdgeInsets.only(bottom: AppMargin.m10),
            child: ListTile(
              title: Text(
                item.username,
              ),
              trailing: Image.network(tempImageUrl),
            ),
          );
        });
  }
}
