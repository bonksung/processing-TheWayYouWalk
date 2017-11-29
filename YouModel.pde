

class You {
  final int objectWidth = 200;
  final int objectHeight = 300;
  int x, y;
  int direction = 0; // 0 ~ 360
  int sequence = 0;  // 0 ~ 3
  final int dy[] = {-1, -1, -1,  0, 0,  1, 1, 1};
  final int dx[] = {-1,  0,  1, -1, 1, -1, 0, 1};
  
  You(int x, int y, int direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  
  int convertDirectionToPos() {
    if(0 <= this.direction && this.direction < 360-45)
      return int(map(this.direction, 0, 360-45, 1, 8));
    return 0;
  }
  
  void walk() {
    int p = this.convertDirectionToPos();
    this.x += dx[p];
    this.y += dy[p];
  }
  
  void render() {
    int p = this.convertDirectionToPos();
    image(YOU_IMAGE[p][sequence], x, y);
  }
}