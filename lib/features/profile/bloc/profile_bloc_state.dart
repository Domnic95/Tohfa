import 'package:demo/features/home/model/section_model.dart';
import 'package:demo/features/home/model/visit_status_model.dart';

abstract class ProfileBlocState {}

class ProfileBlocInitial extends ProfileBlocState {}

class ProfileLoadingState extends ProfileBlocState {}

class ProfileSuccessState extends ProfileBlocState {}

class DropDownValueChangeState extends ProfileBlocState {
  final String value;
  final bool isCustomerSite;
  DropDownValueChangeState({required this.value, required this.isCustomerSite});
}

class ProfileSectionDataState extends ProfileBlocState {
  final List<SectionModel> sectionModel;
  ProfileSectionDataState({required this.sectionModel});
}

class ProfileVisitStatusState extends ProfileBlocState {
  final List<VisitStatusModel> visitStatusModel;
  ProfileVisitStatusState({required this.visitStatusModel});
}

class ProfileErrorState extends ProfileBlocState {
  String? error;

  ProfileErrorState({this.error});
}
