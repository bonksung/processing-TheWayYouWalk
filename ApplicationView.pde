void draw() {  
  render_backgrounds();
  render_stars();
  render_planets();
  render_mirrors();
  you_walk();
  render_yous();
  for(You you : you_should_be) {
    yous.add(you);
  }
  you_should_be.clear();
}