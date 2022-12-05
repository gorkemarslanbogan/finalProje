


enum  IconName{
  product,scanner
}

extension IconExtension on IconName {
  String get IconPath => "assets/icon/$this";
}