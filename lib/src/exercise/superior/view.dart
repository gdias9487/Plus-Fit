import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/src/exercise/superior/exerciseList/view.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class SuperiorPage extends StatefulWidget {
  SuperiorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SuperiorPageState createState() => _SuperiorPageState();
}

class _SuperiorPageState extends State<SuperiorPage> {
  double _slideValue = 0;
  double _slideValue1 = 0;

  String _cursor = "minutos";

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ExerciseContainer(
        width: 1,
        height: 100,
        top: 20,
        left: 20,
        right: 20,
        bottom: 0.0,
        text: document['Nome'],
        action: () {
          Navigator.pushNamed(context, '/exercise');
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController cont = ScrollController();
    void scroll() {
      cont.animateTo(0,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Treinos Superiores',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            color: Colors.white,
            splashRadius: 20,
            iconSize: 35,
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sign_up_background.png"),
                fit: BoxFit.cover)),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('treinos')
                // .where('Nivel', isEqualTo: nivel)
                .where('Tipo', isEqualTo: 'superior')
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return ListView(children: makeListWidget(snapshot));
              }
            }),
      ),
    );
  }
}