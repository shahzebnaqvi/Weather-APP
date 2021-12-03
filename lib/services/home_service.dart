import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/home_model.dart';
import 'package:weatherapp/screens/home.dart';

getuser(String city) async {
  // var response = await http.get(Uri.https("api.openweathermap.org",
  //     "data/2.5/weather?q=Lahore&appid=f5783e1fee68d6228723ecc46804ee40"));
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=f5783e1fee68d6228723ecc46804ee40'));
  var jsonData = jsonDecode(response.body);

  print(jsonData);
  List<HomeModel> users = [];
  HomeModel user = HomeModel(
    userId: jsonData['main']['humidity'],
    id: jsonData['main']['humidity'],
    title: jsonData['main']['humidity'],
    temp: jsonData['main']['temp'],
    timezone: jsonData['timezone'],
    name: jsonData['name'],
    weather: jsonData['weather'][0]['main'],
    pressure: jsonData['main']['pressure'],
    humidity: jsonData['main']['humidity'],
    feels_like: jsonData['main']['feels_like'],
  );
  users.add(user);

  return users;
}
