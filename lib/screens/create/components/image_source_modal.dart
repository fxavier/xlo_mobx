import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  final Function onImageSelected;
  ImageSourceModal(
    this.onImageSelected,
  );
  File? _image;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: getFromCamera,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black),
              child: const Text('Camera'),
            ),
            ElevatedButton(
              onPressed: getFromGalery,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black),
              child: const Text('Galeria'),
            ),
          ],
        ),
      );
    } else if (Platform.isIOS) {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: getFromGalery,
          )
        ],
      );
    }
    return Container();
  }

  Future<void> getFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;

    File? image = File(pickedFile.path);
    selectedImage(image);
  }

  Future<void> getFromGalery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    final image = File(pickedFile!.path);
    selectedImage(image);
  }

  Future<File?> selectedImage(File image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Editar imagem',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Concluir',
        ),
      ],
    );
    if (croppedFile != null) onImageSelected(croppedFile);
    return null;
  }
}
