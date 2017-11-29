void setup() {
  background(0);
  
  load_assets();
}

void settings() {
  int width = getWidth(), height = getHeight();
  size(width, height, P3D); 
}

void load_assets() {
  for(int i=0; i<8; i++) {
    for(int j=0; j<4; j++) {
      YOU_IMAGE[i][j] = loadImage(YI_PREFIX + nf(i*10+j, 2) + ".png");  
    }
  }
}