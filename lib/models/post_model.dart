class Item {
  final int id;
  final String urlImage;
  final String userName;
  final int likes;
  late bool isSaved;

  Item({
    required this.id,
    required this.urlImage,
    required this.userName,
    required this.likes,
    required this.isSaved,
  });
}
