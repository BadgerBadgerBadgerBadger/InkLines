void mouseClicked() {
  if (emitter !=null) emitter.awayFromMouse();
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case RIGHT:
        paperNumber++;
        if (paperNumber == 4) paperNumber = 0;
        println("RIGHT");
        paperDets();
        break;
      case LEFT:
        paperNumber--;
        if (paperNumber == -1) paperNumber = 3;
        println("LEFT");
        paperDets();
        break;
      default:
        break;
    }
  }
  else {
    if (key == 's' || key == 'S') emitter.toggleInkersView();
  }
}