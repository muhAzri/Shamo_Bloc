class GalleryModel {
  final int? id;
  final String? url;

  GalleryModel({
    this.id,
    this.url,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        url: json['url'],
      );
}
