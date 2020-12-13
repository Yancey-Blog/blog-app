part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();
  
  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}
