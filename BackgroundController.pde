void render_backgrounds() {
  imageMode(CORNER);
  image(BACKGROUND_IMAGE[0], 0, 0, width, height/2);
  image(BACKGROUND_IMAGE[1], 0, height/2, width, height/2);
}