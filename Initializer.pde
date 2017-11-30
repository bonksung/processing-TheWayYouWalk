void setup() {
  background(0); 
  load_assets();
}

void settings() {
  int width = getWidth(), height = getHeight();
  size(width, height, P3D); 
  batch_planets();
}

void load_assets() {
  for(int i=0; i<8; i++) 
    for(int j=0; j<4; j++) 
      YOU_IMAGE[i][j] = loadImage(YI_PREFIX + nf(i*10+j, 2) + ".png");
  for(int i=0; i<='z'-'a'; i++) {
    char[] current_alphabet_char = {char('a'+i)};
    String current_alphabet = new String(current_alphabet_char); 
    FLOWER_IMAGE[i] = loadImage(FI_PREFIX + current_alphabet + ".png");
    ALPHABET_IMAGE[i][0] = loadImage(AI_PREFIX + current_alphabet + "_default.png");
    for(int j=1; j<5; j++) 
      ALPHABET_IMAGE[i][j] = loadImage(AI_PREFIX + current_alphabet + "_" + nf(j) + ".png");
  }    
  MIRROR_IMAGE = loadImage(MI_PREFIX + "default.png");
}