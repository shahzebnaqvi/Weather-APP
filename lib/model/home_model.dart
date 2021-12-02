class HomeModel {
  // int id;
  int userId;
  int id;
  int title;
  double temp;
  int timezone;
  String name;
  String weather;
  HomeModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.temp,
      required this.timezone,
      required this.name,
      required this.weather});
}
