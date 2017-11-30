class Mirror {
  float x, y, w, h;
  int angle; // mirror's sight
  void render() {
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));
    imageMode(CENTER);
    image(MIRROR_IMAGE, 0, 0, w*1.4, h*1.4);
    for(int i=int(-w*1.4/2); i<=int(w*1.4/2); i++) {
      stroke(255, 30);
      line(i, 0, i, -random(0,100));
    }
    popMatrix();
  }
}

class FlexibleMirror extends Mirror {
  
  FlexibleMirror(float x, float y, int angle) { 
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.w = width/10;
    this.h = w;
  }
  
  
}