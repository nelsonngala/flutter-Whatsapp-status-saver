part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeToggledEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
