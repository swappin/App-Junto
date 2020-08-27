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

class Pagar extends StatefulWidget {


  final String nome;

  Pagar({Key key,this.nome}) : super(key: key);

  @override
  _PagarState createState() => _PagarState();
}

class _PagarState extends State<Pagar> {
  Future<List<CPagarModel>> getCPagarModel() async {
    final url = "https://api.jsonbin.io/b/5f286d6d6f8e4e3faf2a382f/9";
    final response = await http.get(url);



    if (response.statusCode == 200) {
      var jsonCPagar = jsonDecode(response.body);

      List<CPagarModel> cpagar = [];
      for (var u in jsonCPagar) {
        CPagarModel cpagarmodel = CPagarModel(u["NOME"], u["VALORORIGINAL"],
            u["DATAVENCIMENTO"], u["DATAEMISSAO"]);
        cpagar.add(cpagarmodel);

      }

      return cpagar;

    } else {
      throw Exception();
    }


  }


  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contas a pagar',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 130),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'R\$ 1.000.000',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),

              ),

            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 110),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 190, left: 10, right: 10),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: FutureBuilder(
                future: getCPagarModel(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      if (snapshot.hasData) {
                        return ListTile(
                          leading: Icon(Icons.attach_money,
                              color: Colors.red, size: 30),
                          title: Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'R\$ ',
                                    decimalDigits: 0)
                                .format(double.parse(
                                    snapshot.data[index].VALORORIGINAL)),
                            style: GoogleFonts.montserrat(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              '${snapshot.data[index].NOME} \n  ${snapshot.data[index].DATAVENCIMENTO} '),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return CircularProgressIndicator(
                        strokeWidth: 10,
                      );
                    },
                  );
                }),
          ),
        ),
      ],
    ));
  }
}

class Receber extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  Future<List<CPagarModel>> getCPagarModel() async {
    final url = "https://api.jsonbin.io/b/5f286d6d6f8e4e3faf2a382f/8";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonCPagar = jsonDecode(response.body);

      List<CPagarModel> cpagar = [];
      for (var u in jsonCPagar) {
        CPagarModel cpagarmodel = CPagarModel(
          u["NOME"],
          (u["VALORORIGINAL"]),
          u["DATAEMISSAO"],
          u["DATAVENCIMENTO"],
        );
        cpagar.add(cpagarmodel);
      }
      return cpagar;
    } else {
      throw Exception();
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contas a receber',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 130),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'R\$ 7.000.000',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 110),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 190, left: 10, right: 10),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: FutureBuilder(
              future: getCPagarModel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.attach_money,
                            color: Colors.green, size: 30),
                        title: Text(
                          NumberFormat.currency(
                              locale: 'id',
                              symbol: 'R\$ ',
                              decimalDigits: 0)
                              .format(double.parse(
                              snapshot.data[index].VALORORIGINAL)),
                          style: GoogleFonts.montserrat(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            '${snapshot.data[index].NOME} \n  ${snapshot.data[index].DATAEMISSAO} '),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return CircularProgressIndicator(
                  strokeWidth: 10,
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}

class Clientes extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clientes',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 130),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '75',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 110),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 190, left: 10, right: 10),
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'A E M COBRANÇA MEDEIROS DE ANDRADE',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'ABIANCY CARDOSO ROSA SALAME - PERM JORNAL OPINIAO',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'ALAN RODRIGUES BARBOSA',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'A E M COBRANÇA MEDEIROS DE ANDRADE',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'ABIANCY CARDOSO ROSA SALAME - PERM JORNAL OPINIAO',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.green, size: 30),
                  title: Text(
                    'ALAN RODRIGUES BARBOSA',
                    style: GoogleFonts.montserrat(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('São Paulo - SP'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          VideoPlayer(controller),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Border border;
  final Decoration decoration;
  final Icon icon;
  final Function onClick;

  CircularButton({
    this.color,
    this.width,
    this.height,
    this.icon,
    this.onClick,
    this.border,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0)),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}
