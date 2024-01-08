class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: "العثور على أفضل مكان  للبقاء في سعر جيد",
      image: 'assets/images/image1.png',
      discription: "قم بالتصفية حسب الأثاث والموقع والنوع والسعر"
  ),
  UnbordingContent(
      title: "بيع الممتلكات الخاصة بك بسرعة بنقرة واحدة فقط",
      image: 'assets/images/Image2.png',
      discription: "احصل على مشترين معتمدين لممتلكاتك من خلال لوحة تحكم سهلة الإدارة! "
  ),
  UnbordingContent(
      title: 'ابحث عن الخيار الأمثل لمنزلك المستقبلي',
      image: 'assets/images/image3.png',
      discription: "احصل على مشترين معتمدين لممتلكاتك من خلال لوحة تحكم سهلة الإدارة!"
  ),
];