abstract class DashBoardState {
  int selectedIndex = 0;
  DashBoardState(this.selectedIndex);
}

class DashBoardInItState extends DashBoardState {
  DashBoardInItState(super.selectedIndex);
}

class DashBoardIndexChangeState extends DashBoardState {
  DashBoardIndexChangeState(super.selectedIndex);
}


class DashBoardLoadingState extends DashBoardState {
  DashBoardLoadingState(super.selectedIndex);
}
