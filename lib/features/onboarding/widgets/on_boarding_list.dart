import 'package:twazoon/features/onboarding/model/on_boarding_model.dart';

List<OnBoardingModel> getOnBoardingList() {
  return [
    OnBoardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      title: 'رحلتك نحو راحة نفسية تبدأ من هنا، بجلسات علاجية وتمارين يقظة ذهنية مصممة خصيصًا لك',
    ),
    OnBoardingModel(
      imagePath: 'assets/images/second_onboarding.png',
      title: 'تطبيق ذكي لمساعدتك على تنظيم مشاعرك وتقليل مستويات القلق باستخدام أساليب علمية حديثة',
    ),
    OnBoardingModel(
      imagePath: 'assets/images/last_onboarding.png',
      title: 'مع توازن، تكتسب مهارات الوعي الذاتي وإدارة الضغوط النفسية بخطوات عملية مدروسة',
    ),
  ];
}
