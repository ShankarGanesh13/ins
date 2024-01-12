class ImageModel {
  String path;
  String type;
  ImageModel({required this.path, required this.type});
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'type': type,
    };
  }
}
