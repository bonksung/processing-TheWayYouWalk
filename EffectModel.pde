class Effect {
  float x, y, w, h;
  float r, g, b, alpha;
}

class CloudEffect extends Effect {
  CloudEffect(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class StarEffect extends Effect {
  float opacity = 0;
  int dopacity = 1;
  StarEffect(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 255;
    this.g = 255;
    this.b = 255;
    this.opacity = random(1,99);
    this.w = random(width/1000, width/490);
    this.h = this.w;
  }
  
  void render() {
    opacity += dopacity;
    if(opacity < 0 || opacity > 100) dopacity *= -1;
    if(opacity < 0) {
      this.x = random(0, width);
      this.y = random(0, height);
    }
    noStroke();
    fill(r, g, b, opacity);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
    y+=0.25;
    x+=0.25;
  }
}

class StarfishEffect extends Effect {
  float opacity = 0;
  int dopacity = 1;
  int delay = 100;
  int tail_length = width/4;
  ArrayList<Trace> traces = new ArrayList<Trace>();
  
  StarfishEffect(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = 255;
    this.g = 255;
    this.b = 255;
    this.delay = int(random(100,500));
    this.opacity = 100;
    this.w = width/200;
    this.h = width/200;
  }
  
  void render() {
    if(delay > 0) {
      delay --;
      return;
    }
        
  }
}