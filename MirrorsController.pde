void batch_mirrors() {
  float MIRROR_SIZE = width/10;
  Mirror mirror = new FlexibleMirror(MIRROR_SIZE/2, MIRROR_SIZE/2, 135);
  mirrors.add(mirror);
  mirror = new FlexibleMirror(width-MIRROR_SIZE/2, MIRROR_SIZE/2, 225);
  mirrors.add(mirror);
  mirror = new FlexibleMirror(MIRROR_SIZE/2, height-MIRROR_SIZE/2, 45);
  mirrors.add(mirror);
  mirror = new FlexibleMirror(width-MIRROR_SIZE/2, height-MIRROR_SIZE/2, 315);
  mirrors.add(mirror);
}

void render_mirrors() {
  for(Mirror mirror : mirrors) {
    mirror.render();
  }
}