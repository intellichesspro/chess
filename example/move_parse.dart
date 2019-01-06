import 'package:position/position.dart';

main() {
  print(Move.parse("e2"));
  print(Move.parse("Pe2"));
  print(Move.parse("Ke2"));
  print(Move.parse("Qe2"));
  print(Move.parse("Be2"));
  print(Move.parse("Ne2"));
  print(Move.parse("Re2"));

  print(Move.parse("Qe2"));
  print(Move.parse("Qfe2"));
  print(Move.parse("Q2e2"));
  print(Move.parse("Qf2e2"));

  print(Move.parse("xe2"));

  print(Move.parse("Qxe2"));
  print(Move.parse("Qfxe2"));
  print(Move.parse("Q2xe2"));
  print(Move.parse("Qf2xe2"));

  print(Move.parse("Qe2+"));
  print(Move.parse("Qe2#"));

  print(Move.parse("e8=Q"));
  print(Move.parse("e8=Q+"));
  print(Move.parse("e8=Q#"));

  print(Move.parse("f7e8=R"));
  print(Move.parse("fe8=R+"));
  print(Move.parse("7e8=R#"));
}
