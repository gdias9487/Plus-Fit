import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(color: Colors.white),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              minimumSize: Size(320, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text("Cadastrar")),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(color: porange, width: 1),
                              primary: porange,
                              onPrimary: Colors.white,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              minimumSize: Size(320, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("Entrar"))
                    ],
                  ),
                ),
                SizedBox(height: 65),
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      "Sobre o Aplicativo",
                      style: TextStyle(
                          color: pyellow, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/main_menu_background.png"),
                    fit: BoxFit.cover))));
  }
}