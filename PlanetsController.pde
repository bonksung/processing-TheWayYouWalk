void batch_planets() {
  for(int i=0; i<='z'-'a'; i++) {
    Boolean more_random_batch_needs = true;
    Planet planet = new Planet(char('a'+i), random(0,width), random(0,height));
    while(more_random_batch_needs) {
      float x = random(0, width);
      float y = random(0, height);
      planet = new Planet(char('a'+i), random(0,width), random(0,height)); 
      Boolean collision_with_other = false;
      for(Planet with_other : planets) {
        collision_with_other = planet.check_collision(with_other);
        if(collision_with_other) break;
      }
      if(!collision_with_other) more_random_batch_needs = false;
    } 
    planets.add(planet);  
  }
}

void render_planets() {
  for(Planet planet : planets) {
    planet.render();
  }
}