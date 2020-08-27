

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
