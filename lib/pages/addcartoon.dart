import 'package:catcartoon/pages/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catcartoon/pages/constants.dart';
import 'package:catcartoon/pages/showcartoon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _detail = TextEditingController();


  CollectionReference menu = FirebaseFirestore.instance.collection('Menu');
  Future<void> addProduct() {
    return menu
        .add({
          'cartoon_name': _name.text,
          'type': _type.text,
          'detail': _detail.text,

        })
        .then((value) => print("Product data has been successfully"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('image/.jpg'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 60),
              child: const Text(
                'เพิ่มข้อมูลการ์ตูน',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            formfield(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView formfield(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'ชื่อการ์ตูน',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _type,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'ประเภทการ์ตูน',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _detail,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'รายละเอียด',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'บันทึกข้อมูล',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 255, 208, 89),
                        child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              addProduct();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ShowCartoonPage(),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}