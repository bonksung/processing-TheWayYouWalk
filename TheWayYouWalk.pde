/* The Way You Walk
   http://github.com/bonksung/processing-TheWayYouWalk */

final String ENV = "development"; // "production"

Background background;
ArrayList<You>    yous          = new ArrayList<You>();
ArrayList<You>    you_should_be = new ArrayList<You>();
ArrayList<Planet> planets       = new ArrayList<Planet>();
ArrayList<Mirror> mirrors       = new ArrayList<Mirror>();
ArrayList<StarEffect> stars = new ArrayList<StarEffect>();

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