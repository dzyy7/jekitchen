import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jekitchen/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//fire stone
final FirestoreService firestoreService = FirestoreService();

//text controller
final TextEditingController textController = TextEditingController();

class _HomePageState extends State<HomePage> {
  void openDatabBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestoreService.addData(textController.text);

                      textController.clear();

                      Navigator.pop(context);
                    },
                    child: Text("add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recepie"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: openDatabBox, child: const Icon(Icons.add)),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getDatasStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List datasList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: datasList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = datasList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String recepieText = data['Judul'];

                return ListTile(
                  title: Text(recepieText),
                );
              },
            );
          } else {
            return const Text("No Recepie yet..");
          }
        },
      ),
    );
  }
}
