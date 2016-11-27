class Spray {
  PImage paper;
  Coords brush;
  int wid;
  int hei;
  int rad;
  color shade;
  int lowerAlpha;
  int upperAlpha;
  float xoff = 0;
  PVector[] locations;
  
  Spray(PImage paper, Coords brush, int rad, color shade, int lowerAlpha, int upperAlpha) {
    this.paper = paper;
    this.wid = paper.width;
    this.hei = paper.height;
    this.rad = rad;
    this.shade = shade;
    this.lowerAlpha = lowerAlpha;
    this.upperAlpha = upperAlpha;
    this.brush = brush;
  }
  
  void spray() {
    paper.loadPixels();
    locations = brush.locations();
    for( int i = 0; i < locations.length; i++) {
      for (int j = 0; j < 7; j++) {
        float angle = random( TWO_PI );
        float nRad = random( rad );
        xoff += 0.01;
        
        int x = (int) (locations[i].x - (nRad * cos(angle)));
        int y = (int) (locations[i].y - (nRad * sin(angle)));
        float alph = map(rad, 0, nRad, lowerAlpha, upperAlpha); 
        
        if (x >= wid) x = wid - 1;
        if (x < 0) x = 0;
        if (y >= hei) y = hei - 1;
        if (y < 0) y = 0;
        
        paper.pixels[xyTo1D(x, y, paper.width)] = color(red(shade), green(shade), blue(shade), alph);
      }
    }
  paper.updatePixels();
  }
  
}