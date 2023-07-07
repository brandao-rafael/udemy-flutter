import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('Field', () {
    test('Open Field WITH Explosion', () {
      Field f = Field(line: 0, column: 0);
      f.mine();

      expect(f.open, throwsException);
    });

    test('Open Field WITHOUT Explosion', () {
      Field f = Field(line: 0, column: 0);
      f.open();

      expect(f.opened, isTrue);
    });

    test('Add NOT neighbor', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 3);
      f1.addNeighbor(f2);

      expect(f1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Field f1 = Field(line: 3, column: 3);
      Field f2 = Field(line: 3, column: 4);
      Field f3 = Field(line: 2, column: 2);
      Field f4 = Field(line: 4, column: 4);

      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);

      expect(f1.neighbors.length, 3);
    });

    test('Mines neighborhood', () {
      Field f1 = Field(line: 3, column: 3);
      Field f2 = Field(line: 3, column: 4);
      f2.mine();
      Field f3 = Field(line: 2, column: 2);
      Field f4 = Field(line: 4, column: 4);
      f4.mine();

      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);

      expect(f1.amountOfMinesInTheVicinity, 2);
    });
  });
}