import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/SqlDb.dart';

class page1 extends StatefulWidget {


  @override
  State<page1> createState() => _State();
}

class _State extends State<page1> {
  //crate instance
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            MaterialButton(
              // if operation success return number of row if not success return 0
              onPressed:() async {
              int response = await sqlDb.InsertDataFromDatabase
                ("INSERT INTO 'Upload_Customer_Product_Data' ('ItemName') VALUES ('maaa')");
              print(response);
              },
              color: Colors.blue,
              child: Text('Insert Database'),




            ),
            MaterialButton(
              onPressed:() async{
              List<Map> response = await sqlDb.ReadDataFromDatabase('SELECT * FROM Upload_Customer_Product_Data');
              print('$response');
              },
              color: Colors.blue,
              child: Text('Read Database'),




            ),
          ],
        ),
      ),
    );
  }
}

