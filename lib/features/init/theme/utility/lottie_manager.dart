import 'package:lottie/lottie.dart';
import 'package:zero_hunger/features/constant/lottie_url/lottie_urls.dart';

class ProjectLottieUtility {
  LottieBuilder get lottieNetwork => Lottie.network(LottieUrls.loadingAnimation);
}
