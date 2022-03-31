import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catcartoon/pages/addcartoon.dart';
import 'package:catcartoon/pages/body.dart';
import 'package:catcartoon/pages/constants.dart';
import 'package:catcartoon/pages/editcartoon.dart';
import 'package:catcartoon/pages/cartoondetail.dart';
import 'package:flutter/material.dart';

class ShowCartoonUser extends StatefulWidget {
  const ShowCartoonUser({Key? key}) : super(key: key);

  @override
  _ShowCartoonUserState createState() => _ShowCartoonUserState();
}

class _ShowCartoonUserState extends State<ShowCartoonUser> {
  CollectionReference menu = FirebaseFirestore.instance.collection('Menu');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Catcartoon",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],

          // backgroundColor: Colors.transparent,
          // elevation: 0.0,
        ),
        drawer: Drawer(),
        body: ListView(
          children: [
            Body(),
            showlist(),
          ],
        ),
      ),
    );
  }

  Widget showlist() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Menu').snapshots(),
      // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      builder: (context, snapshot) {
        List<Widget> listMe = [];
        if (snapshot.hasData) {
          var menu = snapshot.data;
          listMe = [
            Column(
              children: menu!.docs.map((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    leading: Image.asset('image/cat2.jpg'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartoonDetail(id: doc.id),
                        ),
                      ).then((value) => setState(() {}));
                    },
                    title: Text(
                      '${data['cartoon_name']}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 238, 159, 0)),
                    ),
                    subtitle: Text("รายละเอียด"),
                  ),
                );
              }).toList(),
            ),
          ];
        }
        return Center(
          child: Column(
            children: listMe,
          ),
        );
      },
    );
  }

  Container txt() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: const Text(
        'Cartoon list',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}