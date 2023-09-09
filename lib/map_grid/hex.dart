// Cube coordinate hex

class Hex {
  final int q;
  final int r;
  final int s;

  Hex(this.q, this.r, this.s) {
    if (q + r + s != 0) {
      throw ArgumentError("not a hex");
    }
  }

  Hex operator +(Hex that) {
    return Hex(q + that.q, r + that.r, s + that.s);
  }

  Hex operator -(Hex that) {
    return Hex(q - that.q, r - that.r, s - that.s);
  }

  double distance(Hex that) {
    final Hex hex = this - that;

    return (hex.q.abs().toDouble() +
            hex.r.abs().toDouble() +
            hex.s.abs().toDouble()) /
        2;
  }
}
