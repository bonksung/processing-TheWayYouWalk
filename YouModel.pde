

class You {
  final int objectWidth = 200;
  final int objectHeight = 300;
  float x, y, w, h;
  int direction = 0; // 0 ~ 360
  int sequence = 0;  // 0 ~ 3
  ArrayList<Trace> traces = new ArrayList<Trace>();
  
  You(float x, float y, int direction) {
    this.x = x;
    this.y = y;
    this.w = width/30;
    this.h = height/30;
    this.direction = direction;
  }
  
  int convertDirectionToPos(int direction) {
    if(0 <= direction && direction < 360-45)
      return int(map(direction, 0, 360-45, 1, 8));
    return 0;
  }
  
  float dx() {
    return cos(radians(90)-radians(direction));  
  }
  
  float dy() {
    return sin(radians(270)-radians(direction)); 
  }
  
  void walk() {
    int p = this.convertDirectionToPos(this.direction);
    //println(nf(direction) + " " + nf(p) + " " + nf(x) + " " + nf(y));
    Trace before = new Trace(this.x, this.y, this.sequence, this.direction);
    this.traces.add(before);
    if(traces.size() > TRACE_LENGTH) {
      this.traces.remove(0);
    }
    this.x += dx();
    this.y += dy();
    if(y <= 0) collision(90);  
    else if(x <= 0) collision(180);
    else if(x >= width) collision(180);
    else if(y >= height) collision(90);
    this.sequence = frameCount / 10 % 4;
  }
  
  void collision(int angle) {
    float new_angle = angle * 2 - this.direction;
    if(new_angle < 0) new_angle += 360;
    this.direction = int(new_angle);
  }
  
  void render() {
    int p;
    imageMode(CENTER);
    if(traces.size() > 0) {
      for(int i=0; i<traces.size(); i++) {
        Trace trace = traces.get(i);
        p = this.convertDirectionToPos(trace.direction);
        tint(255, map(i, 0, TRACE_LENGTH-1, 1, 50));
        image(YOU_IMAGE[p][trace.sequence], trace.x, trace.y, w * i / TRACE_LENGTH, h * i / TRACE_LENGTH);
        tint(255);
      }
    }
    p = this.convertDirectionToPos(this.direction);
    image(YOU_IMAGE[p][sequence], x, y, w, h);
  }
}