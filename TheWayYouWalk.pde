/* The Way You Walk
   http://github.com/bonksung/processing-TheWayYouWalk */

import ddf.minim.*;
import websockets.*;
WebsocketServer ws;

final String ENV = "development"; // "production"

int song_sequence = 1;
ArrayList<You>    yous          = new ArrayList<You>();
ArrayList<You>    you_should_be = new ArrayList<You>();
ArrayList<Planet> planets       = new ArrayList<Planet>();
ArrayList<Mirror> mirrors       = new ArrayList<Mirror>();
ArrayList<StarEffect> stars = new ArrayList<StarEffect>();
ArrayList<StarfishEffect> starfishes = new ArrayList<StarfishEffect>();
ArrayList<Flower> flowers       = new ArrayList<Flower>();
ArrayList<Minim>       minims  = new ArrayList<Minim>();
ArrayList<AudioPlayer> players = new ArrayList<AudioPlayer>();
ArrayList<Flower>   to_be_deleted = new ArrayList<Flower>();
int angle = 0;

boolean the_way_you_walk(PVector[] verts, PVector pos) {
  int i, j;
  boolean c = false;
  int sides = verts.length;
  for (i=0,j=sides-1; i<sides; j=i++)
    if (( ((verts[i].y <= pos.y) && (pos.y < verts[j].y)) || ((verts[j].y <= pos.y) && (pos.y < verts[i].y))) &&
          (pos.x < (verts[j].x - verts[i].x) * (pos.y - verts[i].y) / (verts[j].y - verts[i].y) + verts[i].x) ) 
      c = !c;

  return c;
}

void keyPressed(){
  setup();
}