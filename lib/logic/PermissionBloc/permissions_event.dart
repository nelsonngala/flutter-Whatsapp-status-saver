part of 'permissions_bloc.dart';

abstract class PermissionsEvent extends Equatable {
  const PermissionsEvent();
}

class PermissionstatusEvent extends PermissionsEvent {
  @override
  List<Object?> get props => [];
}

class PermissionsRequestEvent extends PermissionsEvent {
  @override
  List<Object?> get props => [];
}
