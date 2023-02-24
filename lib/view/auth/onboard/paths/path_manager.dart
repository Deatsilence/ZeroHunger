enum OnBoardImagesPaths { onboard1, onboard2, onboard3 }

extension OnBoardImagesPathsExtension on OnBoardImagesPaths {
  String path() => "assets/onboard/png/$name.png";
}
