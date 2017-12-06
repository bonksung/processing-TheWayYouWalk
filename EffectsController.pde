void batch_stars() {
  for(int i=0; i<5000; i++) {
    StarEffect se = new StarEffect(random(width), random(height));
    stars.add(se);
  }
  for(int i=0; i<5; i++) {
    StarfishEffect sf = new StarfishEffect(random(width), random(height));
    starfishes.add(sf);
  }
}

void render_stars() {
  for(StarEffect se : stars) se.render(); 
  for(StarfishEffect sf: starfishes) sf.render();
}