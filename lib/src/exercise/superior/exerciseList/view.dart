import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TrainingContainer.dart';

class ExercisesSuperior extends StatefulWidget {
  ExercisesSuperior(
      {Key key, this.title, @required this.documentId, this.image})
      : super(key: key);

  final String title;
  final String documentId;
  final String image;

  @override
  _ExercisesSuperiorState createState() =>
      _ExercisesSuperiorState(documentId, image);
}

class _ExercisesSuperiorState extends State<ExercisesSuperior> {
  final String documentId;
  final String image;

  _ExercisesSuperiorState(this.documentId, this.image);

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      var nome = document['nome'];
      return ExerciseContainer(
        width: 1,
        height: 100,
        top: 20,
        left: 30,
        right: 30,
        bottom: 0.0,
        image: "assets/signup.jpg",
        text: "$nome",
      );
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sign_up_background.png"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/superior/$image"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      '$documentId',
                      style: defaultFont(30, FontWeight.bold, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   height: 50,
        //   width: 150,
        //   decoration: BoxDecoration(
        //       color: Colors.orange[700],
        //       borderRadius: BorderRadius.circular(20)),
        //   child: FlatButton(
        //     child: Text(
        //       'Iniciar Treino',
        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        Flexible(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('treinos/$documentId/exercicios')
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
      ]),
    ));
  }
}
