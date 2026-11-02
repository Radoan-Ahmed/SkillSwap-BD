abstract final class RouteNames {
  static const login = 'login';
  static const register = 'register';
  static const discovery = 'discovery';
  static const profile = 'profile';
  static const editProfile = 'edit-profile';
  static const chat = 'chat';
}

abstract final class RoutePaths {
  static const login = '/login';
  static const register = '/register';
  static const discovery = '/';
  static const profile = '/profile';
  static const editProfile = 'edit';
  static const chat = '/chat/:peerId';
}
