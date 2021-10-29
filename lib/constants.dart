class Routes {
  static const home = '/';
  static const main = '/main';
  static const camera = '/camera';
  static const compendium = '/compendium';
  static const profil = '/profil';
}

class BoxKeys {
  const BoxKeys();
  String get authenticatedUser => "authenticated_user";
  String get profilPic => "profile_pic";
}

class BoxStorage {
  static const boxName = 'sheika_guide_box';
  static BoxKeys keys = const BoxKeys();
}
