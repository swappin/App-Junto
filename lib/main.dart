import 'dart:convert';
import 'dart:ffi';

import 'package:appjunto/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:video_player/video_player.dart';

import 'CPagarModel.dart';



void main() async{

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'JuntoTelecom',
      theme: ThemeData(),
      home: Splashscreen(),

      routes: <String, WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => new HomeScreen(),
        "/Profile": (BuildContext context) => new Profile(),
        "/Receber": (BuildContext context) => new Receber(),
        "/Pagar": (BuildContext context) => new Pagar(),
        "/Clientes": (BuildContext context) => new Clientes(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/background.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    controller.setLooping(true);
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(
        body: Stack(
      children: <Widget>[

        VideoPlayer(controller),
        Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: -200,
                top: 150,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.0)),
                      width: 400,
                      height: 400,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -250,
                top: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.0)),
                      width: 500,
                      height: 500,
                    ),
                    Transform.translate(
                      offset:
                          Offset.fromDirection(getRadiansFromDegree(735), 470),
                      child: Row(
                        children: <Widget>[
                          CircularButton(
                            color: Colors.black,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pushNamed("/Receber");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Receber',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset.fromDirection(getRadiansFromDegree(747), 527),
                      child: Row(
                        children: <Widget>[
                          CircularButton(
                            color: Colors.black,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pushNamed("/Pagar");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Pagar',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset.fromDirection(getRadiansFromDegree(759), 557),
                      child: Row(
                        children: <Widget>[
                          CircularButton(
                            color: Colors.black,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pushNamed("/Clientes");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Clientes',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset.fromDirection(getRadiansFromDegree(770), 560),
                      child: Row(
                        children: <Widget>[
                          CircularButton(
                            color: Colors.black,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.insert_chart,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pushNamed("");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Gráficos',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset.fromDirection(getRadiansFromDegree(725), 388),
                      child: Row(
                        children: <Widget>[
                          CircularButton(
                            color: Colors.black,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {
                              Navigator.of(context).pushNamed("/Profile");
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Mauro',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class Profile extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Color(0xffffff),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/steve.jpg'),
                    ),
                  ),
                  Text(
                    'Mauro Collato',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'mauro@juntotelecom.com.br',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 320),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.all(20),
                    onPressed: null,
                    child: Text('Notificações',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    padding: const EdgeInsets.all(20),
                    onPressed: null,
                    child: Text('Configurações',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    padding: const EdgeInsets.all(20),
                    onPressed: null,
                    child: Text('Sair',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

