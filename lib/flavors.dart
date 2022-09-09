//ignore_for_file:avoid_classes_with_only_static_members
enum Flavor {
  dev,
  uat,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'PokeApp DEV';
      case Flavor.uat:
        return 'PokeApp UAT';
      case Flavor.prod:
        return 'PokeApp';
      default:
        return 'title';
    }
  }

  static String get baseUrl => '';

}
