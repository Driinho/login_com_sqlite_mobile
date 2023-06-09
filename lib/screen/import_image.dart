import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class ImageImport extends StatefulWidget {
  final void Function(String? imagePath) onImageSelected;
  String? imagePath;

  ImageImport({
    super.key, 
    required this.onImageSelected,
    this.imagePath,
  });

  @override
  State<ImageImport> createState() => _ImageImportState();
}

class _ImageImportState extends State<ImageImport> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey, // Cor de fundo quando não há imagem selecionada
          ),
          child: widget.imagePath != null
              ? ClipOval(
              child: Image.file(
                File(widget.imagePath!),
                fit: BoxFit.cover,
              ),
            )
            : const Icon(
              Icons.image,
              size: 50,
              color: Colors.white,
            ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: FloatingActionButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.image,
              );
              if (result != null) {
                PlatformFile file = result.files.first;
                setState(() {
                  widget.imagePath = file.path;
                });
                widget.onImageSelected(widget.imagePath);
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}