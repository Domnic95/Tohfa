part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}
class EditProfileLoadingState extends EditProfileState {}
class EditProfileValueChangeState extends EditProfileState {}
