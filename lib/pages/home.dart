
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
