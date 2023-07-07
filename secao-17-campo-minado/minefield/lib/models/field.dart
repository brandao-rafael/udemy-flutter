// ignore_for_file: public_member_api_docs, sort_constructors_first
import './explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _open = false;
  bool _marked = false;
  bool _undermined = false;
  bool _exploded = false;
  
  Field({
    required this.line,
    required this.column,
  });

  void addNeighbor(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if(deltaLine == 0 && deltaColumn == 0) return;

    if(deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if(_open) return;

    _open = true;

    if(_undermined) {
      _exploded = true;
      throw ExplosionException();
    }

    if(safeNeighborhood) {
      // ignore: avoid_function_literals_in_foreach_calls
      neighbors.forEach((n) => n.open());
    }
  }

  void showBomb() {
    if(_undermined) {
      _open = true;
    }
  }

  void putMine() {
    _undermined = true;
  }

  void changeAppointment() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _undermined = false;
    _exploded = false;
  }

  bool get undermined {
    return _undermined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _open;
  }

  bool get marked {
    return _marked;
  }

  bool get solved {
    bool minedAndMarked = undermined && marked;
    bool safeAndOpen = !undermined && opened;

    return minedAndMarked || safeAndOpen;
  }

  bool get safeNeighborhood {
    return neighbors.every((neighbor) => !neighbor.undermined);
  }

  int get amountOfMinesInTheVicinity {
    return neighbors.where((n) => n._undermined).length;
  }
}
