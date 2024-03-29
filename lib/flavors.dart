enum Flavor {
  simpsons,
  wire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.simpsons:
        return 'Simpsons App';
      case Flavor.wire:
        return 'Wire App';
      default:
        return 'title';
    }
  }

}
