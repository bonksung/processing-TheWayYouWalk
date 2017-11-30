class Planet {
  char alphabet;
  float x, y, w, h;
  int sequence = 0;
  final int REDUCE_RATIO = 13;
  
  Planet(char alphabet, float x, float y) {
    this.alphabet = alphabet;
    this.w = width/REDUCE_RATIO;
    this.h = height/REDUCE_RATIO;
    
    this.x = min(x, width-this.w);
    this.y = min(y, height-this.h); 
  }
  
  void render() {
    image(ALPHABET_IMAGE[alphabet - 'a'][sequence], x, y, w, h);
  }
  
  Boolean check_collision(Planet target) {
    return ((this.x < target.x + target.w && this.x > target.x) ||
            (target.x < this.x + this.w && target.x > this.x))
           &&((this.y < target.y + target.h && this.y > target.y) ||
              (target.y < this.y + this.h && target.y > this.y));
  }
}