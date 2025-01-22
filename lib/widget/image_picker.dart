import 'dart:convert';
import 'dart:typed_data';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../api/constant.dart';

class PickImage {
  static Future<String?> fromGallery() async {
    Uint8List? imageBytes;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Uint8List uintListImage = await pickedFile.readAsBytes();
      imageBytes = uintListImage;
      return base64Encode(imageBytes);
    }
    return null;
  }

  static Future<String?> fromGalleryNCrop({double? aspectRatio, int? maxHeight, int? maxWidth}) async {
    Uint8List? imageBytes;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Uint8List? croppedImageBytes = await cropImageInWeb(pickedFile, aspectRatio: aspectRatio, maxWidth: maxWidth, maxHeight: maxHeight);
      if (croppedImageBytes != null) {
        imageBytes = croppedImageBytes;
        return base64Encode(imageBytes);
      }
    }
    return null;
  }

  static Future<Uint8List?> cropImageInWeb(XFile pickedFile, {double? aspectRatio, int? maxHeight, int? maxWidth}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        aspectRatio: aspectRatio == null ? null : CropAspectRatio(ratioX: aspectRatio, ratioY: 1),
        maxHeight: maxHeight ?? 800,
        maxWidth: maxWidth ?? 800,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 80,
        sourcePath: pickedFile.path,
        uiSettings: [WebUiSettings(context: navigatorKey.currentState!.context, initialAspectRatio: 1)]);
    if (croppedFile != null) return croppedFile.readAsBytes();
    return null;
  }

  static String base64toApiBase64(String base64Image) => "data:image/png;base64,$base64Image";
}
