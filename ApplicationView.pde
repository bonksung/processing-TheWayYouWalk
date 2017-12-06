void draw() {  
  render_backgrounds();
  render_stars();
  render_planets();
  render_mirrors();
  render_flowers();
  you_walk();
  render_yous();
  
  imageMode(CENTER);
  image(GLOW, width/2, height*3/4, width/3, width/3);
  pushMatrix();
  translate(width/2, height*3/4);
  fill(255, 0, 0, 70);
  rotate(radians(angle));
  triangle(0, -100, -30, -80, 30, -80);
  popMatrix();
  
  rectMode(CENTER);
  colorMode(HSB);
  fill(frameCount % 255, 255, 255);
  noStroke();
  rect(width/2, height*3/4, 15, 15);
  colorMode(RGB);
  
  for(You you : you_should_be) {
    yous.add(you);
  }
  you_should_be.clear();
  for(int i=0; i<flowers.size(); i++) {
    if(flowers.get(i).pop) {
      flowers.remove(i);
      i--;
    }
  }
  if(!players.get(0).isPlaying()) {
    noLoop();  
  }
}