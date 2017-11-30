void setup() {
  background(0); 
  load_assets();
}

void settings() {
  int width = getWidth(), height = getHeight();
  size(width, height, P3D); 
}

void load_assets() {
  for(int i=0; i<8; i++) 
    for(int j=0; j<4; j++) 
      YOU_IMAGE[i][j] = loadImage(YI_PREFIX + nf(i*10+j, 2) + ".png");
  for(int i=0; i<='z'-'a'; i++) {
    char[] current_alphabet_char = {char('a'+i), '_'};
    String current_alphabet = new String(current_alphabet_char); 
    ALPHABET_IMAGE[i][0] = loadImage(AI_PREFIX + current_alphabet + "default.png");
    for(int j=1; j<5; j++) 
      ALPHABET_IMAGE[i][j] = loadImage(AI_PREFIX + current_alphabet + nf(j) + ".png");
  }    
}