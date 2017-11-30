void batch_stars() {
  for(int i=0; i<2000; i++) {
    StarEffect se = new StarEffect(random(width), random(height));
    stars.add(se);
  }
}

void render_stars() {
  for(StarEffect se : stars) {
    se.render(); 
  }
}