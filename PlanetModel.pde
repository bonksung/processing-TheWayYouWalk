class Planet {
  char alphabet;
  float x, y, w, h;
  PVector[] range = new PVector[4];
  int sequence = 0;
  int flower = 0;
  int dflower = 0;
  Boolean virgin = true;
  final int REDUCE_RATIO = 13;
  
  Planet(char alphabet, float x, float y) {
    this.alphabet = alphabet;
    this.w = width/REDUCE_RATIO;
    this.h = height/REDUCE_RATIO;
    this.x = min(x, width-this.w);
    this.y = min(y, height-this.h);
    range[0] = new PVector(x, y);
    range[1] = new PVector(x+w*4/5, y);
    range[2] = new PVector(x+w*4/5, y+h*4/5);
    range[3] = new PVector(x, y+h*4/5);
  }
  
  void calculateflower() {
    flower = min(max(0, flower + dflower), FLOWER_MAX);
    if (7 > flower % 17 && flower % 17 > 3 && dflower == 1) {
      Flower f = new Flower(random(this.x+w*3/8, this.x+this.w*5/8), random(this.y+h*3/8, this.y+h*5/8), this.x+w/2, this.y+h/2, random(10, width/100), alphabet-'a', flowers.size());
      flowers.add(f);
    }
  }
  
  void render() {
    calculateflower();
    image(ALPHABET_IMAGE[alphabet - 'a'][int(map(flower, 0, FLOWER_MAX, 0, 6.99))], x, y, w, h);
  }
  
  Boolean check_collision(Planet target) {
    return ((this.x < target.x + target.w && this.x > target.x) ||
            (target.x < this.x + this.w && target.x > this.x))
           && ((this.y < target.y + target.h && this.y > target.y) ||
               (target.y < this.y + this.h && target.y > this.y));
  }
}