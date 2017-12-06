class Flower {
  int imgPos;
  PVector position;
  int pos_on_flowers;
  float r;
  PVector origposition;
  PVector velocity;
  boolean holding=false;
  boolean disappear=false;
  boolean pop=false;
  Flower(float x, float y, float orgx, float orgy, float _r, int imgPos, int pos_on_flowers ){
    position = new PVector(x, y);
    origposition = new PVector(orgx,orgy);
    velocity = new PVector(0,0);
    r = _r;
    this.imgPos = imgPos;
    this.pos_on_flowers = pos_on_flowers;
  }
  
  boolean inside(int mx, int my){
    float a = position.x -mx;
    float b = position.y -my;
    return sqrt(pow(a, 2) + pow(b, 2))<r/2;
  } 
  
   void update(){
     if(!holding){
       position.add(velocity);
       velocity.mult(0.91);
        if(position.x<origposition.x-1.5 || position.x>origposition.x+1.5 || position.y<origposition.y-1.5 || position.y>origposition.y+1.5 ){
            PVector normal= new PVector();
            normal = PVector.sub(new PVector(origposition.x,origposition.y),position);
            normal.normalize();
            velocity.add(normal);       
        }else{
            position.set(origposition.x,origposition.y);
        }
     }
     if(position.x < origposition.x + 30 && position.x > origposition.x - 30 && position.y < origposition.y + 30 && position.y > origposition.y - 30 && this.disappear) {
       pop = true;
       planets.get(this.imgPos).dflower = -1;
     }
   }
   void checkBoundaryCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } 
    else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  } 
  void display() {
    if(pop) return;
    imageMode(CENTER);
    image(FLOWER_IMAGE[imgPos], position.x, position.y, r*2, r*2);
  }
  
  void checkCollision(Flower other) {
    if(holding) return;
    // get distances between the balls components
    PVector bVect = PVector.sub(other.position, position);
    if (bVect.mag() < r + other.r) {
      bVect.normalize();
      bVect.mult(2);
      velocity.sub(bVect);
    }
  }
}