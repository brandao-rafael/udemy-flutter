import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
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
          child: const Text('Nenhuma imagem'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary
            ),
            icon: const Icon(Icons.camera),
            label: const Text('Tirar foto'),
          ),
        ),
      ],
    );
  }
}
