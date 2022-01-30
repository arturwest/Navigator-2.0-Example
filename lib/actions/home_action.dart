class HomeAction {
  HomeAction._();

  factory HomeAction.sideMenuClick(int index) = SideMenuClick;
}

class SideMenuClick extends HomeAction {
  final int selectedIndex;

  SideMenuClick(this.selectedIndex) : super._();
}
