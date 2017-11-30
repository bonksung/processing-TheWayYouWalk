void you_walk() {
  for(You you : yous) you.walk();
}

void render_yous() {
  for(You you : yous) you.render(); 
}

void batch_you() {
  You you = new You(width/2, height*3/4, 349);
  yous.add(you);
  you = new You(width/2+41, height*3/4, 213);
  yous.add(you);
  you = new You(width/2-52, height*3/4, 32);
  yous.add(you);
  you = new You(width/2+22, height*3/4, 124);
  yous.add(you);
}