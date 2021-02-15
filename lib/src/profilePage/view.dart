import 'package:flutter/material.dart';
import 'package:plusfit/authentication.dart';
import 'package:plusfit/widgets/Buttons.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plusfit/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../components/constants.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPerfilPageState createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<PerfilPage> {
  PickedFile _imagefile;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Desconectar"),
            content: new Text("Você Deseja Realmente Sair ?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    logoff(firebaseUser) {
      context.read<AuthenticationService>().signOut();
      if (firebaseUser == null) {
        Navigator.pushNamed(context, '/home');
      }
    }

    final firebaseUser = context.watch<User>();
    void _showDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Desconectar"),
              content: Text("Você Deseja Realmente Sair ?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    logoff(firebaseUser);
                  },
                ),
              ],
            );
          });
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.create),
              color: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => _editar()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backperfil.png"),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    perfilImagem(),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Carlos Dias",
                          style: defaultFont(18, FontWeight.bold, Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "carlinhos@hotmail.com",
                          style: defaultFont(12, FontWeight.bold, Colors.white),
                        ),
                        Row(
                          children: <Widget>[
                            DefaultElevatedButton(
                              color: porange,
                              fontSize: 12,
                              height: 60,
                              radius: 25,
                              width: 30,
                              text: 'Desconectar',
                              action: () {
                                _showDialog();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Conta",
                  style: defaultFont(20, FontWeight.bold, Colors.white),
                ),
                SizedBox(height: 10.0),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                          leading: Icon(Icons.person, color: Colors.black),
                          title: Text(
                            "Informações pessoais",
                            style: defaultFont(
                                16, FontWeight.normal, Colors.black),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                          leading: Icon(Icons.vpn_key, color: Colors.black),
                          title: Text(
                            "Alterar senha",
                            style: defaultFont(
                                16, FontWeight.normal, Colors.black),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                          leading: Icon(Icons.assignment_turned_in_sharp,
                              color: Colors.black),
                          title: Text(
                            "Treinos",
                            style: defaultFont(
                                16, FontWeight.normal, Colors.black),
                          ),
                          onTap: () {},
                        ),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading:
                              Icon(Icons.block_outlined, color: Colors.red),
                          title: Text(
                            "Desativar conta",
                            style:
                                defaultFont(16, FontWeight.normal, Colors.red),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Configurações",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            onTap: () {
                              Switch(
                                value: true,
                                onChanged: (bool value) {},
                              );
                            },
                            leading:
                                Icon(Icons.notifications, color: Colors.black),
                            title: Text(
                              "Notificações",
                              style: defaultFont(
                                  16, FontWeight.normal, Colors.black),
                            )),
                        Divider(height: 10.0, color: Colors.grey),
                        ListTile(
                          leading: Icon(Icons.headset_mic, color: Colors.black),
                          title: Text(
                            "Suporte",
                            style: defaultFont(
                                16, FontWeight.normal, Colors.black),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _editar() {
    return Container(
      height: 1200.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 25,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Editar Conta",
            style: TextStyle(
                fontSize: 25.0, fontWeight: FontWeight.bold, color: porange),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Novo Nome'),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Novo Email'),
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RaisedButton(
              child: Text("Alterar"),
              color: porange,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  imageChecker() {
    if (_imagefile == null) {
      return AssetImage("assets/homem.png");
    } else {
      return FileImage(File(_imagefile.path));
    }
  }

  Widget perfilImagem() {
    return Hero(
        tag: 'profile',
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: imageChecker(),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bordaEdit()),
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget bordaEdit() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Escolha uma opção",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takedPhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takedPhoto(ImageSource.gallery);
                },
                label: Text("Galeria"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takedPhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imagefile = pickedFile;
    });
  }
}
