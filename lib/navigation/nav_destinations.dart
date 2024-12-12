enum NavDestinations {
  welcome('welcome', '/welcome'),
  signIn('signIn', '/signIn'),
  signUp('signUp', '/signUp'),
  menuTapBar('menu_tab_bar', '/menu_tab_bar');

  final String name;
  final String route;

  const NavDestinations(this.name, this.route);
}
