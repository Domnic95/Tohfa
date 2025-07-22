abstract class DashBoardEvent {}

class DashBoardInItEvent extends DashBoardEvent {
  int selectedIndex;

  DashBoardInItEvent(this.selectedIndex);
}

class DashBoardIndexChangeEvent extends DashBoardEvent {
  int selectedIndex;

  DashBoardIndexChangeEvent(this.selectedIndex);
}

class GetNotification extends DashBoardEvent {

}
