int xyTo1D(int x, int y, int wid) {
  return x + (y * wid);
}

boolean isNumeric(String str) {
  try{
    int in = Integer.parseInt(str);
  }
  catch(NumberFormatException nfe) {
    return false;
  }
  return true;
}

float to2(float num) {
  return Math.round(num * 100) / 100.0;  
}

void paperDets() {
  color sha = brushes[paperNumber].shade;
  println(red(sha) + " " + green(sha) + " " + blue(sha));  
}