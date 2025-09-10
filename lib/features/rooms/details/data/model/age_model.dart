class AgeModel {
  final String title;
  final String subTitle;

  AgeModel({required this.title, required this.subTitle});
  static List<AgeModel> ageList = [
    AgeModel(title: 'Adults', subTitle: 'Ages 18 Or Above'),
    AgeModel(title: 'Children', subTitle: 'Ages 2-17'),
    AgeModel(title: 'Infants', subTitle: 'Under 2'),
  ];
}
