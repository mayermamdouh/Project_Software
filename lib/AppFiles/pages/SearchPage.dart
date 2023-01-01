import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
    String NameProduct = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.black12]
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: TextField(
            onChanged: (textEntered){
              setState(() {
                NameProduct = textEntered;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for Product...',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 6),
                  child: IconButton(
                    icon: Icon(Icons.search , color: Colors.black,),
                    onPressed: (){
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (NameProduct !="" && NameProduct !=null )
            ? FirebaseFirestore.instance.collection("Product").where("product Name",isEqualTo:NameProduct ).snapshots()
            :FirebaseFirestore.instance.collection("Product").snapshots(),
        builder: (Context,snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
              ?Center(child: CircularProgressIndicator(),):
              ListView.builder(
                  itemCount:snapshot.data!.docs.length ,
                  itemBuilder: (Context,Index){
                    DocumentSnapshot data = snapshot.data!.docs[Index];
                    return Container(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(data['product Name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            leading: CircleAvatar(
                              child: Image.network(data['Photo'],width: 100,height: 50,fit: BoxFit.contain,),
                              radius: 40,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Divider(thickness: 2,),
                        ],
                      ),
                    ),
                    );
                  }

              );
        },
      ),

    );
  }
}
