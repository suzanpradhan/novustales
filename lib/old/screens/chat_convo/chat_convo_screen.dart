import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'inner_screen.dart';

class ChatConvoScreen extends StatefulWidget {
  const ChatConvoScreen({super.key});

  @override
  State<ChatConvoScreen> createState() => _ChatConvoScreenState();
}

class _ChatConvoScreenState extends State<ChatConvoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("users"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(); // Display a loading indicator while waiting for data.
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var datas =
                    snapshot.data?.docs[index].data() as Map<String, dynamic>;

                var fullName = datas.containsKey('name')
                    ? datas['name']
                    : "Name Not Found";

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InnerScreen(
                              uid: datas['uid'],
                              isGroupChat: false,
                              groupName: "",
                            ),
                          ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(fullName),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
