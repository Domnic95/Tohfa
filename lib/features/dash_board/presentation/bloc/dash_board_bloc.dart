import '../../../../export.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  ValueNotifier<int> notificationCount = ValueNotifier<int>(0);
  DashBoardBloc() : super(DashBoardInItState(Singleton.instance.dashBoardIndex)) {
    on<DashBoardIndexChangeEvent>((event, emit) async {
      Singleton.instance.dashBoardIndex = event.selectedIndex;
      emit(DashBoardIndexChangeState(event.selectedIndex));
    });
    on<DashBoardInItEvent>((event, emit) {
      Singleton.instance.dashBoardIndex = event.selectedIndex;
      // add(GetNotification());
      notificationCount.value = int.tryParse(Singleton.instance.userData?.notificationCount) ?? 0;
      emit(DashBoardIndexChangeState(Singleton.instance.dashBoardIndex));
    });
    on<GetNotification>((event, emit) async {});
  }
}
