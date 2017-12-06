

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
    this.x += 4*dx();
    this.y += 4*dy();
    if(y <= 0) this.direction = collision(90);  
    else if(x <= 0) this.direction = collision(180);
    else if(x >= width) this.direction = collision(180);
    else if(y >= height) this.direction = collision(90);
    collision_with_mirrors();
    collision_with_planets();
    this.sequence = frameCount / 10 % 4;
  }
  
  void collision_with_mirrors() {
    if(this.traces.size() < TRACE_LENGTH) return;
    for(Mirror mirror : mirrors) {
      if(the_way_you_walk(mirror.range, new PVector(this.x, this.y))) {
        int reflect_angle = collision(mirror.angle_plus_90());
        
        You ed = new You(x, y, reflect_angle);
        you_should_be.add(ed); //after render everything
        this.direction = int(degrees(radians(this.direction) + radians(180)));
        return;
      }
    }
  }
  
  void collision_with_planets() {
    for(Planet planet : planets) {
      if(the_way_you_walk(planet.range, new PVector(this.x, this.y))) {
        if(planet.virgin) {
          planet.virgin = !planet.virgin;
          up_sequence();
        }
        planet.dflower = 1;
      }
    }
  }
  
  int collision(int angle) {
    float new_angle = angle * 2 - this.direction;
    if(new_angle < 0) new_angle += 360;
    return int(new_angle);
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