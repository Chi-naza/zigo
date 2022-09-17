import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';

class FirebaseStorageService extends GetxService {

  // Gets Images from the Firebase Storage. Gets specific images based on arguments passed
  Future<String?> getImages({String? imageName, required String storageFolder, required String debugErrorText}) async {
    if(imageName == null){
      return null;
    }

    try{
      var urlRef = firebaseStorage.child(storageFolder).child('${imageName.toLowerCase()}.png');
      var imageUrl = await urlRef.getDownloadURL();
      return imageUrl;
    }catch (e){
      print("${debugErrorText.toUpperCase()}: $e");
      return null;
    }

  }



}