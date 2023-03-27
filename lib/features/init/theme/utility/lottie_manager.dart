import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_hunger/features/constant/lottie_url/lottie_urls.dart';

class ProjectLottieUtility {
  Center get lottieLoading => Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Lottie.asset(LottiePath.loadingAnimation),
        ),
      );
}
