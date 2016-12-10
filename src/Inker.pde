class Inker extends Entity {
  
 boolean show = true;
 int alti;
 int ID;
 
 Inker(PVector location, float mass, float restitution, float maxSpeed, float maxForce, int xBound, int yBound, boolean show) {
   super(location, 5, color(random(255), random(255), random(255)), color(random(255), random(255), random(255)), mass, restitution, maxSpeed, maxForce, 0, false, 1000, xBound, yBound);
   
   this.show = show;
 }
 
 void display() {
   if (show) {
    fill(shade);
    noStroke();
    ellipse(location.x, location.y, size, size);
   }  
 }
 
 void toggleDisplay() {
   show = !show;
 }
 
 void applyForce(PVector force) {
  force.mult(1/mass);
  acceleration.add(force);  
 }
}