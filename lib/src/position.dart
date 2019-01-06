abstract class Pos {

}

class File implements Pos {
  final String file;

  final int x;

  const File._(this.file, this.x);

  factory File.fromX(int x) {
    return File._(xToFile(x), x);
  }

  factory File(String file) {
    return File._(file, fileToX(file));
  }

  static int fileToX(String file) => file.codeUnitAt(0) - 97;

  static String xToFile(int x) => String.fromCharCode(97 + x);

  static final a = File("a");
  static final b = File("b");
  static final c = File("c");
  static final d = File("d");
  static final e = File("e");
  static final f = File("f");
  static final g = File("g");
  static final h = File("h");

  String toString() => "$file";
}

class Rank implements Pos {
  final int rank;

  final int y;

  const Rank._(this.rank, this.y);

  factory Rank(int rank) {
    return Rank._(rank, rank - 1);
  }

  factory Rank.fromStr(String notation) {
    final y = notation.codeUnitAt(0) - 49;
    return Rank._(y + 1, y);
  }

  factory Rank.fromY(int y) {
    return Rank._(y + 1, y);
  }

  static final one = Rank(1);
  static final two = Rank(2);
  static final three = Rank(3);
  static final four = Rank(4);
  static final five = Rank(5);
  static final six = Rank(6);
  static final sever = Rank(7);
  static final eight = Rank(8);

  String toString() => "$rank";
}

class Square implements Pos {
  final String file;

  final int rank;

  final int x;

  final int y;

  final int pos;

  Square._({this.file, this.rank, this.x, this.y, this.pos});

  factory Square(String notation) {
    if (notation.length != 2) throw Exception("Invalid PGN position!");
    return Square.from(notation[0], int.parse(notation[1]));
  }

  factory Square.from(String file, int rank) {
    final x = File.fileToX(file);
    final y = rank - 1;
    return Square._(file: file, rank: rank, x: x, y: y, pos: x + (y * 8));
  }

  factory Square.fromXY(int x, int y) {
    final file = File.xToFile(x);
    return Square._(file: file, rank: y - 1, x: x, y: y, pos: x + (y * 8));
  }

  factory Square.fromPos(int pos) => Square.fromXY(pos % 8, pos ~/ 8);

  String toString() => "$file$rank";
}
