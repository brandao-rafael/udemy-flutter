// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {

  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeAppointement;
  

  const FieldWidget({
    Key? key,
    required this.field,
    required this.onOpen,
    required this.onChangeAppointement,
  }) : super(key: key);

  Widget _getImage() {
    int amountBombs = field.amountOfMinesInTheVicinity;
    if(field.opened && field.undermined && field.exploded) {
      return Image.asset('lib/assets/images/bomba_0.jpeg');
    } else if (field.opened && field.undermined) {
      return Image.asset('lib/assets/images/bomba_1.jpeg');
    } else if (field.opened) {
      return Image.asset('lib/assets/images/aberto_$amountBombs.jpeg');
    } else if (field.marked) {
      return Image.asset('lib/assets/images/bandeira.jpeg');
    } else {
      return Image.asset('lib/assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onChangeAppointement(field),
      child: _getImage(),
    );
  }
}
