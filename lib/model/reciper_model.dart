class Reciper {
  final String name;
  final String authorName;
  final String authorPhoto;
  final List<dynamic> images;

  Reciper(this.name, this.authorName, this.authorPhoto, this.images);

  Reciper.fromJson(Map<String, dynamic> json)
      : name = json['reciper_name'],
        authorName = json['author'],
        authorPhoto = json['author_photo'],
        images = json['reciper_images'];
}
