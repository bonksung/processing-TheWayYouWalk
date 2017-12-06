void setup() {
  background(0); 
  load_assets();
  ws = new WebsocketServer(this,8025,"/john");
}

void settings() {
  int width = getWidth(), height = getHeight();
  size(width, height, P3D);
  batch_stars();
  batch_mirrors();
  batch_planets();
  batch_you();
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
    ALPHABET_IMAGE[i][5] = loadImage(AI_PREFIX + current_alphabet + "_" + "glow_1.png");
    ALPHABET_IMAGE[i][6] = loadImage(AI_PREFIX + current_alphabet + "_" + "glow_2.png");
  }   
  MIRROR_IMAGE = loadImage(MI_PREFIX + "default.png");
  GLOW = loadImage(AI_PREFIX + "glow.png");
  for(int i=0; i<4; i++)
    BACKGROUND_IMAGE[i] = loadImage(BI_PREFIX + nf(i) + ".png");
  for(int i=1; i<=27; i++) {
    Minim minim = new Minim(this);
    AudioPlayer player = minim.loadFile(BGM_PREFIX + nf(i) + ".mp3");
    minims.add(minim);
    if(i>1) player.mute();
    player.play();
    if(i > 1) {
      player.cue(players.get(0).position()); 
    }
    players.add(player);
  }
  
}