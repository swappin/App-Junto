

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
