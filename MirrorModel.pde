class Mirror {
  float x, y, w, h;
  PVector[] range = new PVector[4];
  int angle; // mirror's sight
  
  int angle_plus_90() {
    return int(degrees(radians(this.angle) + radians(90)));  
  }
  
  void render() {
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));
    imageMode(CENTER);
    image(MIRROR_IMAGE, 0, 0, w*1.4, h*1.4);
    for(int i=int(-w*1.4/2); i<=int(w*1.4/2); i++) {
      stroke(255, 30);
      line(i, 0, i, -random(0,200));
    }
    range[0] = new PVector(screenX(-w*1.4/2, 0), screenY(-w*1.4/2, 0)); 
    range[1] = new PVector(screenX(w*1.4/2, 0),  screenY(w*1.4/2, 0)); 
    range[2] = new PVector(screenX(w*1.4/2, 50),  screenY(w*1.4/2, 50));
    range[3] = new PVector(screenX(-w*1.4/2, 50), screenY(-w*1.4/2, 50));
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