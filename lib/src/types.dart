class PieceType {
  final int id;

  final String name;

  final String pgn;

  const PieceType(this.id, this.name, this.pgn);

  static const pawn = PieceType(0, "Pawn", "P");
  static const king = PieceType(1, "King", "K");
  static const queen = PieceType(2, "Queen", "Q");
  static const bishop = PieceType(3, "Bishop", "B");
  static const knight = PieceType(4, "Knight", "N");
  static const rook = PieceType(5, "Rook", "R");

  String toString() => pgn;

  static const map = {
    0: pawn,
    1: king,
    2: queen,
    3: bishop,
    4: knight,
    5: rook,
    10: pawn,
    11: king,
    12: queen,
    13: bishop,
    14: knight,
    15: rook,
    'P': pawn,
    'K': king,
    'Q': queen,
    'B': bishop,
    'N': knight,
    'R': rook,
    'p': pawn,
    'k': king,
    'q': queen,
    'b': bishop,
    'n': knight,
    'r': rook,
  };
}

class Color {
  final int id;

  final String name;

  const Color(this.id, this.name);

  static const white = Color(0, 'white');
  static const black = Color(1, 'black');

  static const map = {
    0: white,
    1: black,
    "white": white,
    "black": black,
    "White": white,
    "Black": black,
    "WHITE": white,
    "BLACK": black,
    "w": white,
    "b": black,
  };

  static Color from(dynamic /* String | int */ rep) => map[rep];
}

class Piece {
  final int id;

  final PieceType type;

  final Color color;

  final String fen;

  const Piece(this.id, this.type, this.color, this.fen);

  bool operator ==(other) => other is Piece && other.id == this.id;

  String toString() => fen;

  static const whitePawn = Piece(0, PieceType.pawn, Color.white, 'P');
  static const whiteKing = Piece(1, PieceType.king, Color.white, 'K');
  static const whiteQueen = Piece(2, PieceType.queen, Color.white, 'Q');
  static const whiteBishop = Piece(3, PieceType.bishop, Color.white, 'B');
  static const whiteKnight = Piece(4, PieceType.knight, Color.white, 'N');
  static const whiteRook = Piece(5, PieceType.rook, Color.white, 'R');

  static const blackPawn = Piece(10, PieceType.pawn, Color.black, 'p');
  static const blackKing = Piece(11, PieceType.king, Color.black, 'k');
  static const blackQueen = Piece(12, PieceType.queen, Color.black, 'q');
  static const blackBishop = Piece(13, PieceType.bishop, Color.black, 'b');
  static const blackKnight = Piece(14, PieceType.knight, Color.black, 'n');
  static const blackRook = Piece(15, PieceType.rook, Color.black, 'r');

  static const map = {
    0: whitePawn,
    1: whiteKing,
    2: whiteQueen,
    3: whiteBishop,
    4: whiteKnight,
    5: whiteRook,
    10: blackPawn,
    11: blackKing,
    12: blackQueen,
    13: blackBishop,
    14: blackKnight,
    15: blackRook,
    'P': whitePawn,
    'K': whiteKing,
    'Q': whiteQueen,
    'B': whiteBishop,
    'N': whiteKnight,
    'R': whiteRook,
    'p': blackPawn,
    'k': blackKing,
    'q': blackQueen,
    'b': blackBishop,
    'n': blackKnight,
    'r': blackRook,
  };
}
