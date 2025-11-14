class OnBoardingModel {
  final String title;
  final String desc;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.desc,
    required this.image,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: "اكتشف أفضل العروض",
    desc: "تصفح آلاف المنتجات والعروض الحصرية من متاجرك المفضلة في مكان واحد",
    image: "assets/images/onBoarding_one.png",
  ),
  OnBoardingModel(
    title: "وفر أكثر مع خصومات حصرية",
    desc: "احصل على خصومات تصل إلى 70% على أشهر العلامات التجارية والمتاجر",
    image: "assets/images/onBoarding_two.png",
  ),
  OnBoardingModel(
    title: "تسوق بذكاء وادفع أقل",
    desc: "مقارنة الأسعار وتنبيهات الخصومات لتجربة تسوق مذهلة بتوفير كبير",
    image: "assets/images/onBoarding_three.png",
  ),
];
