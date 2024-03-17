import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// final storage = FirebaseStorage.instanceFor(bucket: "gs://my-custom-bucket");

Future<(List<String>, Object?)> uploadFilesToFirebaseStorage(
    
    Map<String, Uint8List> images,
    String directory) async {
  final FirebaseStorage storage =
      FirebaseStorage.instanceFor(bucket: "gs://surreal-db.appspot.com");

  List<String> imageUrls = [];
  Object? errors;

  // Use for loop to ensure asynchronous tasks are awaited properly
  for (var entry in images.entries) {
    String key = entry.key;
    Uint8List value = entry.value;

    Reference storageReference = storage.ref().child('$directory/$key');
    UploadTask uploadTask = storageReference.putData(value);

    try {
      await uploadTask.whenComplete(() async {
        var downloadUrl = await storageReference.getDownloadURL();
        imageUrls.add(downloadUrl);
      });
    } catch (error) {
      errors = error;
      // print("Error uploading $key: $error");
      // Handle the error as needed
    }
  }

  // print(imageUrls);
  return (imageUrls, errors);
}

// Future<List<String>> uploadFilesToFirebaseStorage(
//     Map<String, Uint8List> images, String dicrectory) async {
//   final FirebaseStorage storage =
//       FirebaseStorage.instanceFor(bucket: "gs://surreal-db.appspot.com");

//   List<String> imageurls = [];
//   // Use Future.wait to upload all files concurrently
//   images.forEach((key, value) async {
//     Reference storageReference = storage.ref().child('$dicrectory/$key');
//     UploadTask uploadTask = storageReference.putData(value);
//     // storageReference.getDownloadURL();

//     await uploadTask.whenComplete(() async {
//       var a = await storageReference.getDownloadURL();
//       imageurls.add(a);
//     });
//   });

//   print(imageurls);
//   return imageurls;
// }

Future<Map<String, Uint8List>?> getFilesAndimage() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result != null) {
    Map<String, Uint8List> images = {};
    // List<File> files = result.files.map((path) => File(path.path!)).toList();

    for (var element in result.files) {
      images.addAll({element.name: element.bytes!});
    }
    // List<Uint8List> files = result.files.map((path) => path.bytes!).toList();

    // print(files);
    // var a = result.files.first.name;

    // uploadFilesToFirebaseStorage(images);

    return images;
  } else {
    return null;
    // User canceled the picker
  }
}
