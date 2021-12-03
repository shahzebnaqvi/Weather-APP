import 'package:flutter/material.dart';
import 'package:weatherapp/services/home_service.dart';

String city = "Lahore";
int font1 = 22;
int font2 = 22;
Color fontcolor = Colors.white;
Color fontcolor1 = Colors.grey;
String backgif = "assets/images/night.gif";
String city1 = "";

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

List favourite = [];
TextEditingController txtcity = TextEditingController();

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getuser(city),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              Icon weathericon = Icon(
                Icons.wb_sunny_outlined,
                color: fontcolor,
                size: MediaQuery.of(context).size.height * 0.15,
              );
              String a = snapshot.data[0].weather;
              print("aasassa");
              print(a);
              if (a == 'Smoke') {
                String backgif = "assets/images/day.gif";
                Icon weathericon = Icon(
                  Icons.add,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else if (a == 'Clear') {
                String backgif = "assets/images/dayg.gif";
                Icon weathericon = Icon(
                  Icons.add,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else if (a == 'Clouds') {
                String backgif = "assets/images/night.gif";
                Icon weathericon = Icon(
                  Icons.add,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              } else {
                String backgif = "assets/images/electric.gif";
                Icon weathericon = Icon(
                  Icons.add,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.height * 0.15,
                );
              }

              return Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: new BoxDecoration(
                  color: Colors.black,
                  // color: Colors.blueGrey[200],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: AssetImage(backgif)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter City Name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            onChanged: (value) {
                              city1 = value;
                              setState(() {
                                // checkweather(
                                //     "${snapshot.data[0].weather}", context);
                              });
                            },
                            onSubmitted: (value) {
                              city1 = value;
                              setState(() {
                                if (city1 != "") {
                                  city = city1;
                                }
                                // checkweather(
                                //     "${snapshot.data[0].weather}", context);
                              });
                              txtcity.clear();
                            },
                            controller: txtcity,
                          )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (city1 != "") {
                                    city = city1;
                                  }
                                });
                                txtcity.clear();
                              },
                              child: Icon(
                                Icons.search,
                                color: fontcolor,
                              )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (txtcity != "") {
                                  favourite.add(city1);
                                }
                              });
                              txtcity.clear();
                              print(favourite);
                            },
                            child: Icon(Icons.add, color: fontcolor),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13,
                          bottom: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: weathericon,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "${snapshot.data[0].name}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            color: fontcolor),
                      ),
                      Text(
                        "${(snapshot.data[0].temp - 273).toStringAsFixed(0)}°",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.18,
                            color: fontcolor),
                      ),
                      Text(
                        "${snapshot.data[0].weather}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: fontcolor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${snapshot.data[0].pressure}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: fontcolor),
                              ),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: fontcolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${snapshot.data[0].humidity}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: fontcolor),
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: fontcolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${(snapshot.data[0].feels_like - 273).toStringAsFixed(0)}°",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: fontcolor),
                              ),
                              Text(
                                "Feels Like",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: fontcolor),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                        ),
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height * 0.23,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: favourite.length,
                            // itemCount: 39,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                  future: getuser(favourite[index]),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      // return CircularProgressIndicator();
                                      return Container();
                                    } else {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04),
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                        decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ]),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${snapshot.data[0].name}",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                  color: fontcolor),
                                            ),
                                            Icon(Icons.wb_sunny_outlined,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.08,
                                                color: fontcolor),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Text(
                                              "${(snapshot.data[0].temp - 273).toStringAsFixed(0)}°",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.08,
                                                  color: fontcolor),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  });
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
