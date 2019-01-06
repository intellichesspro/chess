import 'package:meta/meta.dart';

import 'types.dart';
import 'position.dart';

abstract class Move {
  static Move parse(String format) {
    bool isMate = false;
    bool isCheck = false;
    if (format.endsWith("#")) {
      isMate = true;
      format = format.substring(0, format.length - 1);
    } else if (format.endsWith("+")) {
      isCheck = true;
      format = format.substring(0, format.length - 1);
    }

    // King side castle
    if (format == "0-0" || format == "O-O") {
      return CastlingMove(isMate: isMate, isCheck: isCheck);
    }

    // Queen side castle
    if (format == "0-0-0" || format == "O-O-O") {
      // TODO queen side castle
      return CastlingMove(isMate: isMate, isCheck: isCheck, queenSide: true);
    }

    PieceType promotedTo;
    bool isCapture = false;

    if (format.contains("=")) {
      final parts = format.split("=");
      promotedTo = PieceType.map[parts[1]];
      format = parts[0];
    }

    PieceType piece = PieceType.pawn;
    String sourceStr = '';

    if (format.contains('x')) {
      isCapture = true;
      final parts = format.split('x');
      format = parts[1];
      sourceStr = parts[0];
    } else {
      if (format.length > 2) {
        sourceStr = format.substring(0, format.length - 2);
        format = format.substring(format.length - 2);
      }
    }

    Pos source;

    // Parse piece
    if (sourceStr.isNotEmpty) {
      String first = sourceStr[0];
      PieceType p = PieceType.map[first];
      if (p != null) {
        piece = p;
        sourceStr = sourceStr.substring(1);
      }
    }

    // Parse source
    if (sourceStr.isNotEmpty) {
      if (sourceStr.length == 2) {
        source = Square(sourceStr);
      } else if (sourceStr.length == 1) {
        final char = sourceStr.codeUnitAt(0);
        if (char >= 97 && char <= 104) {
          source = File(sourceStr);
        } else if (char >= 49 && char <= 56) {
          source = Rank.fromStr(sourceStr);
        }
      } else {
        throw Exception("Invalid format!");
      }
    }

    Square destination = Square(format);

    if (promotedTo != null) {
      return PromotionMove(
          isMate: isMate,
          isCheck: isCheck,
          promotedTo: promotedTo,
          isCapture: isCapture,
          destination: destination,
          disambiguation: source);
    }

    return NormalMove(
        isMate: isMate,
        isCheck: isCheck,
        destination: destination,
        isCapture: isCapture,
        piece: piece,
        disambiguation: source);
  }
}

class CastlingMove implements Move {
  final bool isMate;

  final bool isCheck;

  final bool queenSide;

  CastlingMove(
      {@required this.isMate, @required this.isCheck, this.queenSide: false});

  String toString() {
    final sb = StringBuffer("O-O");
    if(queenSide) {
      sb.write("-O");
    }
    if(isCheck) {
      sb.write("+");
    } else if(isMate) {
      sb.write("#");
    }
    return sb.toString();
  }
}

class NormalMove implements Move {
  final bool isMate;

  final bool isCheck;

  final Square destination;

  final PieceType piece;

  final bool isCapture;

  final Pos disambiguation;

  NormalMove(
      {@required this.isMate,
      @required this.isCheck,
      @required this.destination,
      @required this.isCapture,
      @required this.piece,
      @required this.disambiguation});

  String toString() {
    final sb = StringBuffer();
    if(piece != PieceType.pawn) {
      sb.write(piece.pgn);
    }
    if(disambiguation != null) {
      sb.write(disambiguation);
    }
    if(isCapture) {
      sb.write("x");
    }
    sb.write(destination);
    if(isCheck) {
      sb.write("+");
    } else if(isMate) {
      sb.write("#");
    }
    return sb.toString();
  }
}

class PromotionMove implements Move {
  final bool isMate;

  final bool isCheck;

  final Square destination;

  final bool isCapture;

  final PieceType promotedTo;

  final Pos disambiguation;

  PromotionMove(
      {@required this.isMate,
      @required this.isCheck,
      @required this.destination,
      @required this.isCapture,
      @required this.promotedTo,
      @required this.disambiguation});

  String toString() {
    final sb = StringBuffer();
    if(disambiguation != null) {
      sb.write(disambiguation);
    }
    if(isCapture) {
      sb.write("x");
    }
    sb.write(destination);
    sb.write("=$promotedTo");
    if(isCheck) {
      sb.write("+");
    } else if(isMate) {
      sb.write("#");
    }
    return sb.toString();
  }
}

class PGN {}
