import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  final dbRef = FirebaseFirestore.instance.collection("lancamentosAberto");

  Future getData() async {
    await Firebase.initializeApp();

    var _firestore = FirebaseFirestore.instance.collection("lancamentosAberto");
    List<String> lancamentos = [];
    await _firestore.get().then((lancamentos) {
      lancamentos.docs.forEach((lancamento) {
        print(lancamento.data);
      });
    });



  }




  @override


  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = [0.0, 1.0, 1.5, 2.0, 0.0,0.0, -0.5, -1.0, -0.5, 0.0, 2.0];
    var datas = [0.0, 1.0, 1.5, 2.0, 0.0,1.0, -0.5, -1.0, -0.5, 0.0, 0.0];



    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Pesquisar'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Configurações'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        body: Stack(

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 55),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qualicorp.',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 110),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total lucro',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 130),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'R\$ 8.990.00',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        ListView(
          padding: EdgeInsets.only(left: 10, top: 250, right: 10),
          children: <Widget>[

             InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/Receber");
              },
              child: Center(

                child: Container(

                  height: 300,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(5),
                      bottomRight: const Radius.circular(5),
                      topLeft: const Radius.circular(5),
                      topRight: const Radius.circular(5),
                    ),
                  ),
                    child: CustomScrollView(

                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(20.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              <Widget>[
                                Text("Contas a receber",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),),),
                                Text("Total",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                 Text(
                                    'R\$ 4.990.00',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.green,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 28,
                                    ),),),
                                Sparkline(
                                    data: data,
                                  lineColor: Colors.green,
                                  pointsMode: PointsMode.all,
                                  pointSize: 8.0
                                )

                              ],
                            ),
                          ),
                        ),

                      ],

                    ),

                ),

              ),
            ),
            SizedBox(
                child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
            )),

            Center(

              child: Container(
                  height: 300,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(5),
                      bottomRight: const Radius.circular(5),
                      topLeft: const Radius.circular(5),
                      topRight: const Radius.circular(5),
                    ),
                  ),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            <Widget>[
                              Text("Contas a pagar",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 30,
                                  ),),),
                              Text("Total",
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text(
                                'R\$ 990.00',
                                style: GoogleFonts.montserrat(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 28,
                                  ),),),
                              Sparkline(
                                  data: datas,
                                  lineColor: Colors.red,
                                  pointsMode: PointsMode.all,
                                  pointColor: Colors.grey,
                                  pointSize: 8.0
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        )
      ],
    ));
  }
}


