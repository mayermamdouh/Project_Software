import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/SqlDb.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../components.dart';
import '../../login/user_model_function.dart';
import 'package:path/path.dart' as p;


class page1 extends StatefulWidget {


  @override
  State<page1> createState() => _State();
}

class _State extends State<page1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // controller.clear();
  }
  @override



  //crate instance
  SqlDb sqlDb = SqlDb();
  var ItemName = TextEditingController();
  var ItemDescription = TextEditingController();
  var ChildAgeMonth = TextEditingController();
  var ChildAgeYear = TextEditingController();
  var Size = TextEditingController();
  var Category_cat = TextEditingController();
  var FormKey4 = GlobalKey<FormState>();
  bool isTrue1 = true;
  // imageFile

  File? imageFile;
   String? _url;
  String? url;
  // File? file = File(XFile!.path);
  //File file  = File(imageFile!.path);
  showOption(BuildContext context){
    return showDialog(context: context,
        builder: (context)=>
            AlertDialog(
              title:const Text('choose one'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading:const Icon(Icons.image),
                      title:const Text('Callary'),
                      onTap:()=> ImageFromGallary(context),
                    ),
                    ListTile(
                      leading:const Icon(Icons.image),
                      title:const Text('Camera'),
                      onTap:()=> ImageFromCamera(context),
                    )
                  ],
                ),
              ),
            )
    );
  }

  Future ImageFromGallary(BuildContext context)async{
    XFile?  image = await ImagePicker().pickImage(source: ImageSource.gallery) ;
    setState(() {
      //imageFile = image as File? ;
       imageFile = File(image!.path);
    });
    Navigator.pop(context);
  }

  Future ImageFromCamera(BuildContext context)async{
    XFile?  image = await ImagePicker().pickImage(source: ImageSource.camera) ;
    setState(() {
       imageFile = File(image!.path);
    });
    Navigator.pop(context);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Container(
              color: Colors.white,
              child: Form(
                key: FormKey4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          //Image.file(imageFile!,width: 300,height: 200,fit: BoxFit.cover,)
                          child:imageFile != null ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.file(imageFile!,width: 300,height: 200,fit: BoxFit.cover,))
                        : Image.network('https://cdn.pixabay.com/photo/2015/12/09/22/38/camera-1085705__480.png'),
                      //Image.network('https://cdn.pixabay.com/photo/2015/12/09/22/38/camera-1085705__480.png')
                      ),
                      SizedBox(height: 15,),
                      ButtonLogin(
                        width: 160,
                        height: 35,
                        text: 'Uplaod Photo',
                        function: () {
                          setState(() {
                            showOption(context);
                          });
                        },
                      ),
                      SizedBox(height: 20,),
                      isTrue1 ? FormUpdateProduct(): const Center(
                        child:  Text(' Product Publishing successful !',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:15 ,
                        ),),
                      ),

                      // CircleAvatar(
                      //   backgroundImage: imageFile==null? null : FileImage(imageFile!),
                      //   radius: 80,
                      // ),
                      // GestureDetector(
                      //   onTap:ImageUpload ,
                      //   child: Icon(Icons.camera_alt),
                      // ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget FormUpdateProduct()=>
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextButtom(
                controller: ItemName,
                icon: Icons.drive_file_rename_outline,
                lable: 'Item Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Item Name must be not empty';
                  }
                },
              ),
              SizedBox(height: 10,),
              TextButtom(
                controller: ItemDescription,
                icon: Icons.drive_file_rename_outline,
                lable: 'Item Description',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Item Description must be not empty';
                  }
                },
              ),
              SizedBox(height: 10,),
              TextButtom(
                controller: ChildAgeMonth,
                icon: Icons.drive_file_rename_outline,
                lable: 'Child Age Month',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Child Age Month must be not empty';
                  }
                },
              ),
              SizedBox(height: 10,),
              TextButtom(
                controller: ChildAgeYear,
                icon: Icons.drive_file_rename_outline,
                lable: 'Child Age Year',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Child Age Year must be not empty';
                  }
                },
              ),

              SizedBox(height: 10,),
              TextButtom(
                controller: Size,
                icon: Icons.drive_file_rename_outline,
                lable: 'Size',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Size must be not empty';
                  }
                },
              ),
              SizedBox(height: 10,),
              TextButtom(
                controller: Category_cat,
                icon: Icons.drive_file_rename_outline,
                lable: 'category',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'category must be not empty';
                  }
                },
              ),

              SizedBox(height: 20,),
              ButtonLogin(
                width: 200,
                height: 40,
                text: 'publishing',
                function: () {
                  setState(() {
                  isTrue1 = false;
                  if (FormKey4.currentState!.validate()) {
                    Upload_Product_create(
                        ItemName:ItemName.text ,
                        ItemDescription: ItemDescription.text,
                        ChildAgeMonth: ChildAgeMonth.text,
                        ChildAgeYear: ChildAgeYear.text,
                        Size: Size.text,
                        Category:  Category_cat.text,
                     // Photo:imageFile,


                    );
                    UploadImage();

                  }
                  });
                },
              ),
            ],
          ),
        ),

      );

// void ImageUpload()async{
//   var imageee = await ImagePicker().pickImage(source: ImageSource.camera) ;
//   setState(() {
//     imageFile = imageee as File?;
//   });
// }

   UploadImage() async {
  try {
    //String url;
    FirebaseStorage storageImage = FirebaseStorage.instanceFor(
        bucket: 'gs://firstprojectfirebase-3f25f.appspot.com');
    Reference ref = storageImage.ref().child(
        p.basename(imageFile!.path)); // name image
    UploadTask storageUploadTask = ref.putFile(imageFile!); // ref = file

    storageUploadTask.whenComplete(() async{
      try{
        url = await ref.getDownloadURL();
      }catch(onError){
        print("Error");
      }
      print(url);
    });

    // storageUploadTask.then((res) {
    //   res.ref.getDownloadURL();
    //   // res.ref.getDownloadURL() as String?;
    //   // url = (res.ref.getDownloadURL()).toString();
    //   // print(url);
    // });
    //url =storageUploadTask.ref.getDownloadURL() ;
   // print(url);
    setState(() {
      _url = url;
    });
  }catch(error){
    print(error.toString());
  }

  // storageUploadTask.whenComplete(() {
  //   url = ref.getDownloadURL() as String;
  // }).catchError((onError) {
  //   print(onError);
  // });
  // return url;

}

}


