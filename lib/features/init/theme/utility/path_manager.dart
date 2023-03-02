enum OnBoardImagesPaths { onboard1, onboard2, onboard3 }

extension OnBoardImagesPathsExtension on OnBoardImagesPaths {
  String get path => "assets/onboard/png/$name.png";
}

enum LoginImagesPaths { shation }

extension LoginImagesPathsExtension on LoginImagesPaths {
  String get path => "assets/login/png/$name.png";
}
