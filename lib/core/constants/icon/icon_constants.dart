class IconConstants {
  static IconConstants? _instace;

  static IconConstants get instance => _instace ??= IconConstants._init();

  IconConstants._init();

  String get logo => toPng('veli');

  String get hotDog => toPng('hotdogs');
  String get projeIcon => toPng('cirlce_hwa');

  String toPng(String name) => 'asset/image/$name.png';
}