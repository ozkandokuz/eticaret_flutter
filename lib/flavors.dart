enum Flavor {
  MEGAKITAP,
  ARTSHOPIX,
  YINYOGASHOP,
}

class F {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.MEGAKITAP:
        return 'megakitap';
      case Flavor.ARTSHOPIX:
        return 'artshopix';
      case Flavor.YINYOGASHOP:
        return 'yinyogashop';
      default:
        return 'title';
    }
  }
  static String get url {
    switch (appFlavor) {
      case Flavor.MEGAKITAP:
        return 'https://www.megakitap.com';
      case Flavor.ARTSHOPIX:
        return 'https://www.artshopix.com';
      case Flavor.YINYOGASHOP:
        return 'https://www.yinyogashop.com';
      default:
        return 'title';
    }
  }
}
