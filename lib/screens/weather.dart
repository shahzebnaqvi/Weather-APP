import 'package:flutter/material.dart';

int font1 = 22;
int font2 = 22;
Color fontcolor = Colors.white;
Color fontcolor1 = Colors.grey;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            color: Colors.blue[400],
            // color: Colors.blueGrey[200],
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     colorFilter: new ColorFilter.mode(
            //         Colors.black.withOpacity(0.4), BlendMode.dstATop),
            //     image: AssetImage("assets/images/electric.gif")),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField()),
                  Icon(Icons.search),
                  Icon(Icons.add)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Icon(Icons.wb_sunny_outlined,
                  size: MediaQuery.of(context).size.height * 0.12,
                  color: fontcolor),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "Cloudy",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    color: fontcolor),
              ),
              Text(
                "Islamabad",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: fontcolor),
              ),
              Text(
                "20°",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.14,
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
                        "222",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: fontcolor),
                      ),
                      Text(
                        "Pressure",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: fontcolor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "222",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: fontcolor),
                      ),
                      Text(
                        "Humidity",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: fontcolor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "222",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: fontcolor),
                      ),
                      Text(
                        "Feels Like",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: fontcolor),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.04),
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.04),
                            decoration: BoxDecoration(
                                color: Colors.blue[500],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Text(
                                  "Islamabad",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: fontcolor),
                                ),
                                Icon(Icons.wb_sunny_outlined,
                                    size: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: fontcolor),
                                Text(
                                  "20°",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.08,
                                      color: fontcolor),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
