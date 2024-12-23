enum NavDestinations {
  welcome('welcome', '/welcome'),
  signIn('signIn', '/signIn'),
  signUp('signUp', '/signUp'),
  bottomNav('bottomNav', '/bottomNav'),
  section('section','/section');

  final String name;
  final String route;

  const NavDestinations(this.name, this.route);
}
