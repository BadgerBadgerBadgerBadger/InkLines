class InkerEmitter implements Coords {
  ArrayList<Inker> inkers;
  boolean showInkers = true;

  InkerEmitter(int numberOfInkers, float leastMass, float mostMass, float leastForce, float mostForce
    , float leastSpeed, float mostSpeed, float restitution, int xBound, int yBound, boolean show) {
    inkers = new ArrayList(numberOfInkers);
    for (int i = 0; i < numberOfInkers; i++) {
      PVector location = new PVector(random(width), random(height));
      float mass = random(leastMass, mostMass);
      float maxSpeed = random(leastSpeed, mostSpeed);
      float maxForce = random(leastForce, mostForce);
      Inker inker = new Inker(location, mass, restitution, maxSpeed, maxForce, xBound, yBound, show);
      //print(inker.mass);
      inkers.add(inker);
    }
  }

  void run(PVector force, PVector target) {
    for (Inker inker: inkers) {
      if (force != null) inker.applyForce(force);
      if (target != null) inker.steer(target);
      inker.update();
      if (showInkers) inker.display();
    }
  }
  
  void toggleInkersView() {
    showInkers = !showInkers;  
  }
  
  void applyForce(PVector force) {
    for (Inker inker: inkers) {
      if (force != null) inker.applyForce(force);
    }
  }
  
  void awayFromMouse() {
    for (Inker inker: inkers) {
      PVector force = PVector.sub(inker.location, new PVector(mouseX, mouseY));
      force.normalize();
      force.mult(50);
      inker.applyForce(force);
    }
  }
  
  PVector[] locations() {
    PVector[] returnArray = new PVector[inkers.size()];
    for(int i = 0; i < inkers.size(); i++) {
      returnArray[i] = inkers.get(i).location;
    }
    return returnArray;
  }
}