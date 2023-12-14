class ApiWallpaperModel {
  final int id;
  final String wallpaperUrlImg;
  final String wallpaperColor;
  final int wallpaperHeight;
  final String wallpaperCategory;
  final int wallpaperViews;

  ApiWallpaperModel({
    required this.id,
    required this.wallpaperUrlImg,
    required this.wallpaperColor,
    required this.wallpaperHeight,
    required this.wallpaperCategory,
    required this.wallpaperViews,
  });
}
