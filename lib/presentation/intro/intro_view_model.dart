import 'package:stacked/stacked.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';

class IntroViewModel extends BaseViewModel {
  List<Map<String, String>> imageData = [
    {
      'image': AppAssets.firstCarouselImage,
      'title': 'Cost- Efficiency',
      'text': 'Save on transaction costs and boost\n your profitability',
    },
    {
      'image': AppAssets.secondCarouselImage,
      'title': 'Increased Revenue',
      'text': 'Streamlined payment processes\n lead to higher revenue',
    },
    {
      'image': AppAssets.thirdCarouselImage,
      'title': 'Digital Solutions',
      'text': 'Cutting-edge payment solutions for\n online and mobile payments',
    },
  ];

  int _currentCarouselIndex = 0;

  int get currentCarouselIndex => _currentCarouselIndex;

  void setCarouselIndex(int index) {
    _currentCarouselIndex = index;
    notifyListeners();
  }
}
