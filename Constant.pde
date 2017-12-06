final int screenWidth  = 3700;
final int screenHeight = 2080*2;
final int reductionRatio = 2;
final int TRACE_LENGTH = 250;
final int FLOWER_MAX = 50;

final String YI_PREFIX = "assets/you/";
final String AI_PREFIX = "assets/alphabet/";
final String FI_PREFIX = "assets/flower/";
final String MI_PREFIX = "assets/mirror/";
final String BI_PREFIX = "assets/background/";
final String BGM_PREFIX = "assets/song/";

PImage[][] YOU_IMAGE = new PImage[8][4];
PImage[][] ALPHABET_IMAGE = new PImage[26][7];
PImage[] FLOWER_IMAGE = new PImage[26];
PImage[] BACKGROUND_IMAGE = new PImage[4];
PImage MIRROR_IMAGE;
PImage GLOW;

int getWidth() {
  if (ENV == "production") return screenWidth;
  return screenWidth/reductionRatio;
}

int getHeight() {
  if (ENV == "production") return screenHeight;
  return screenHeight/reductionRatio;
}