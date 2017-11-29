class Effect {
  int x, y;
  float r, g, b, alpha;
}

class CloudEffect extends Effect {
  CloudEffect(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class StarEffect extends Effect {
  StarEffect(int x, int y) {
    this.x = x;
    this.y = y;
  }
}