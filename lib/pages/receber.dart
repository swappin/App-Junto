
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
