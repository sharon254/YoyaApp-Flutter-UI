import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/UI/screens/home_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List info = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((s) {
      setState(() {
        info = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Colors.indigoAccent.withOpacity(0.8),
            ],
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen()));
                              },
                            ),
                            Expanded(
                              child: Row(),
                            ),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Legs Toning ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            Text(
                              'and Glutes Workout ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Colors.white70.withOpacity(0.3),
                                      Colors.white70.withOpacity(0.3),
                                    ]),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '68 Min',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  height: 30,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Colors.white70.withOpacity(0.3),
                                      Colors.white70.withOpacity(0.3),
                                    ]),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.handyman,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Resistent band, Kettlebell',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Circuit 1 : Legs Toning ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.repeat,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('3 sets'),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: info.length,
                            itemBuilder: (_, int index){
                              return GestureDetector(
                                child: Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  info[index]["thumbnail"]
                                                )
                                              )
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,

                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      info[index]["title"],
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: Colors.black87
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,

                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    info[index]["time"],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16,
                                                        color: Colors.black87
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,

                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              gradient: LinearGradient(colors: [
                                                Colors.deepPurpleAccent.withOpacity(0.3),
                                                Colors.deepPurpleAccent.withOpacity(0.3),
                                              ]),
                                            ),
                                            child: Row(
                                              children: [

                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '17 secs rest',
                                                  style: TextStyle(
                                                    color: Colors.deepPurpleAccent,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                for (int i=0; i<70; i++)
                                                Container(
                                                  width: 3,
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    gradient: LinearGradient(colors: [
                                                      Colors.deepPurpleAccent.withOpacity(0.3),
                                                      Colors.deepPurpleAccent.withOpacity(0.3),
                                                    ]),
                                                  ),

                                                )

                                              ],

                                            ),
                                          )
                                        ],
                                      )


                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },


                              );

                        }),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
