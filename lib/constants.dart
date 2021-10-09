class Routes {
  static const home = '/';
  static const main = '/main';
  static const camera = '/camera';
  static const monsters = '/monsters';
}

class BoxKeys {
  const BoxKeys();
  String get authenticatedUser => "authenticated_user";
}

class BoxStorage {
  static const boxName = 'sheika_guide_box';
  static BoxKeys keys = const BoxKeys();
}
