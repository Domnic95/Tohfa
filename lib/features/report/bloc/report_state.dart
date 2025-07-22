import 'package:demo/features/report/model/dispatch_status_model.dart';
import 'package:demo/features/report/model/token_model.dart';

import '../model/invoices_res_model.dart';
import '../model/notification_model.dart';
import '../model/order_memo_model.dart';
import '../model/past_food_order_res_model.dart';

sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoadingState extends ReportState {}

final class ReportSuccessState extends ReportState {}

final class OrderMemoSuccessState extends ReportState {
  final OrderMemoResModel orderMemoModel;

  OrderMemoSuccessState({required this.orderMemoModel});
}

final class GetTokenSuccessState extends ReportState {
  final List<TokenModel> tokenModel;

  GetTokenSuccessState({required this.tokenModel});
}

final class NotificationSuccessState extends ReportState {
  final List<NotificationItem> notificationModel;

  NotificationSuccessState({required this.notificationModel});
}

final class DispatchStatusSuccessState extends ReportState {
  final DispatchStatusResModel dispatchStatusResModel;

  DispatchStatusSuccessState({required this.dispatchStatusResModel});
}

final class InvoicesSuccessState extends ReportState {
  final InvoicesResModel invoicesResModel;

  InvoicesSuccessState({required this.invoicesResModel});
}

final class PastFoodOrderSuccessState extends ReportState {
  final PastFoodOrderResModel pastFoodOrderResModel;

  PastFoodOrderSuccessState({required this.pastFoodOrderResModel});
}

final class ReportErrorState extends ReportState {
  final String? errorMessage;

  ReportErrorState({this.errorMessage});
}
