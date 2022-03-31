import 'package:flutter/rendering.dart';
import 'package:catcartoon/pages/body_detail.dart';
import 'package:catcartoon/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartoonDetail extends StatefulWidget {
  const CartoonDetail({Key? key, required this.id}) : super(key: key);
  final String id;
 
  @override
  _CartoonDetailState createState() => _CartoonDetailState();
}

class _CartoonDetailState extends State<CartoonDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "รายละเอียด",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_sharp,color: Colors.pink,),
              onPressed: () {},
            )
          ],
        ),
        body: showDetail(context),
      ),
    );
  }

  Widget showDetail(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference menu = FirebaseFirestore.instance.collection('Menu');
    return FutureBuilder<DocumentSnapshot>(
      future: menu.doc(widget.id).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: size.height * 0.35,
                        decoration: BoxDecoration(color: kPrimaryColor),
                        child: Image.asset('image/cat2.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${data['cartoon_name']}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            'ประเภทการ์ตูน',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${data['type']}',
                            style: const TextStyle(
                                height: 1.5,
                                fontSize: 20,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'เนื่อเรื่องย่อ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${data['detail']}',
                            style: const TextStyle(
                                height: 1.5,
                                fontSize: 20,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const Text('Loading');
      },
    );
  }

}