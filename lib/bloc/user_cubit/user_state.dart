part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final UserInfoModel model;
  final bool changed;
  const UserState({required this.model, required this.changed});
}

class UserInitial extends UserState {
  UserInitial()
      : super(
            model: UserInfoModel(responseData: ResponseData()), changed: false);
  @override
  List<Object> get props => [model, changed];
}

class UserUpdateState extends UserState {
  const UserUpdateState({required super.model, required super.changed});
  @override
  List<Object> get props => [model, changed];
}
