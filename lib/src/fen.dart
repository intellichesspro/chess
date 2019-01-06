import 'types.dart';

class FenParser {
  static parse(String fen) {
    final parts = fen.split(" ");

    Color toMove = Color.from(parts[1]);
    final cells = <int, Piece>{};
    // TODO castling status
    // TODO enpassant
    // TODO fifty move rule
    // TODO full move number

    final ranks = parts[0].split("/");
    for (int i = 0; i < 8; i++) {
      cells.addAll(parseRow(i, ranks[i]));
    }
  }

  static Map<int, Piece> parseRow(int y, String row) {
    final ret = <int, Piece>{};
    int x = 0;
    for (int i = 0; i < row.length; i++) {
      String char = row[i];
      int charCode = char.codeUnitAt(0);

      if (charCode > 48 && charCode < 57) {
        x += charCode;
        continue;
      }

      ret[(y * 8) + x] = Piece.map[char];
    }
    return ret;
  }

  static const charP = 80;
  static const charK = 75;
  static const charQ = 81;
  static const charB = 66;
  static const charN = 78;
  static const charR = 82;

  static const charp = 112;
  static const chark = 107;
  static const charq = 113;
  static const charb = 98;
  static const charn = 110;
  static const charr = 114;

  static const char0 = 48;
  static const char9 = 57;
}