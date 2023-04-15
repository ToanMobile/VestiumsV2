enum Flavor {
  develop,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.develop:
        return 'Vestiums Dev';
      case Flavor.production:
        return 'Vestiums';
      default:
        return 'title';
    }
  }

}
