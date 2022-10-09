part of 'permissions_bloc.dart';

abstract class PermissionsState extends Equatable {
  const PermissionsState();
}

class PermissionsInitial extends PermissionsState {
  @override
  List<Object?> get props => [];
}

class PermissionsGrantedState extends PermissionsState {
  @override
  List<Object?> get props => [];
}

class PermissionsDenied extends PermissionsState {
  @override
  List<Object?> get props => [];
}

class PermissionsDeniedForever extends PermissionsState {
  @override
  List<Object?> get props => [];
}
