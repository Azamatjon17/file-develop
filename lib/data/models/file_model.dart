class FileModel {
  int id;
  String title;
  String url;
  String videoUrl;
  String imageUrl;
  bool isLoading;
  bool isDownloaded;
  double progress;
  String saveUrl;
  String description;
  List<String> category;

  FileModel({
    required this.category,
    required this.videoUrl,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.url,
    this.isLoading = false,
    this.isDownloaded = false,
    this.progress = 0,
    this.saveUrl = "",
  });
}
