import 'package:flutter/material.dart';
import 'package:weatherapp/services/home_service.dart';

String city = "Karachi";
String city1 = "";
List favourite = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

TextEditingController txtcity = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getuser(city),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return Column(
              children: [
                ListTile(
                  leading: Text("${snapshot.data[0].id}"),
                  title: Text(
                      "${(snapshot.data[0].temp - 273).toStringAsFixed(0)}"),
                  // subtitle: (Text(snapshot.data[index].username)),
                ),
                TextField(
                  onSubmitted: (value) {
                    city1 = value;
                    setState(() {
                      if (city1 != "") {
                        city = city1;
                      }
                    });
                    txtcity.clear();
                  },
                  controller: txtcity,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (city1 != "") {
                          city = city1;
                        }
                      });
                      txtcity.clear();
                    },
                    child: Text("change")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (city1 != "") {
                          favourite.add(city1);
                        }
                      });
                      txtcity.clear();
                      print(favourite);
                    },
                    child: Text("change"))
              ],
            );
          }
        },
      ),
    );
  }
}
