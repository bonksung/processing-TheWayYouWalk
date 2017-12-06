void render_flowers() {
  for (Flower f : flowers) {
    f.update();
    f.display();
    f.checkBoundaryCollision();
    for (Flower f2 : flowers) {
      f2.checkCollision(f);  
    }
  }  
}