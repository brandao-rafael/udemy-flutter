import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

void main() {
  test('Win Game', () {
    Board board = Board(lines: 2, columns: 2, amountOfBombs: 0);

    board.fields[0].putMine();
    board.fields[3].putMine();

    board.fields[0].changeAppointment();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].changeAppointment();

    expect(board.solved, isTrue);
  });
}