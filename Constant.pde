final int screenWidth  = 3840;
final int screenHeight = 2160*2;
final int reductionRatio = 6;

final String YI_PREFIX = "assets/you/";
final String AI_PREFIX = "assets/alphabet/";
final String FI_PREFIX = "assets/flower/";

PImage[][] YOU_IMAGE = new PImage[8][4];
PImage[][] ALPHABET_IMAGE = new PImage[26][5];
PImage[] FLOWER_IMAGE = new PImage[26];

int getWidth() {
  if (ENV == "production") return screenWidth;
  return screenWidth/reductionRatio;
}

int getHeight() {
  if (ENV == "production") return screenHeight;
  return screenHeight/reductionRatio;
}