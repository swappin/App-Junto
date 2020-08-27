
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
