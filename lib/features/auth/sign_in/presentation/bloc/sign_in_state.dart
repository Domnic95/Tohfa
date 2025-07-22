import '../../model/customer_site_id_model.dart';
import '../../model/login_res_model.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInValueChangeState extends SignInState {}

class SignInSuccessState extends SignInState {
  List<LoginResponseModel> loginResponse;
  List<CustomerSiteIdModel>? customerSiteModel;
  SignInSuccessState(this.loginResponse,{this.customerSiteModel});
}

class SignInSuccessState2 extends SignInState {
  List<CustomerSiteIdModel> customerSiteModel;

  SignInSuccessState2({required this.customerSiteModel});
}

class SignInErrorState extends SignInState {
  final String? error;

  SignInErrorState({this.error});
}

