import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  
  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 180,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          child: _storedImage == null
              ? const Text('Nenhuma imagem')
              : Image.file(
                  _storedImage as File,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary),
            icon: const Icon(Icons.camera),
            label: const Text('Tirar foto'),
          ),
        ),
      ],
    );
  }
}
