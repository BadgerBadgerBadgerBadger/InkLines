import g4p_controls.*;

InkerEmitter emitter;
Spray[] brushes;
PImage[] papers;

float LEAST_FORCE = 0.3;
float MOST_FORCE = 3.0;
int LEAST_SPEED = 9;
int MOST_SPEED = 19;
float LEAST_MASS = 3;
float MOST_MASS = 13;

String lowerForceLimit = "Lower Force Limit:";
String upperForceLimit = "Upper Force Limit:";
String lowerSpeedLimit = "Lower Speed Limit:";
String upperSpeedLimit = "Upper Speed Limit:";
String lowerMassLimit = "Lower Mass Limit:";
String upperMassLimit = "Upper Mass Limit:";

int paperNumber = 0;
int framRat = 30;

String detsText = "Current Paper: ";

boolean run = false;

void setup() {  
  size(700, 500);
  background(0);
  frameRate(framRat);
  
  brushes = new Spray[4];
  papers = new PImage[4];
  
  createGUI();
  initGUI();
  
  setDrawSurface();
  
  PaperPanel.setVisible(false);
}

void draw() {
  background(0);
  //image(papers[paperNumber], 0, 0);
 
 if (run) {
   emitter.run(null, new PVector(mouseX, mouseY));
   brushes[0].spray();
   brushes[1].spray();
   brushes[2].spray();
   brushes[3].spray();
 }
 
 image(papers[paperNumber], 0, 0);
 
 dets.setText(detsText + paperNumber);
 dets.setTextBold();
}

void initGUI() {
  leastForceSlider.setLimits(0.00, LEAST_FORCE, MOST_FORCE);
  mostForceSlider.setLimits(0.00, LEAST_FORCE, MOST_FORCE);
  leastSpeedSlider.setLimits(0.00, LEAST_SPEED, MOST_SPEED);
  mostSpeedSlider.setLimits(0.00, LEAST_SPEED, MOST_SPEED);
  leastMassSlider.setLimits(0.00, LEAST_MASS, MOST_MASS);
  mostMassSlider.setLimits(0.00, LEAST_MASS, MOST_MASS);
  
  leastForceLabel.setText(lowerForceLimit + " 0.00");
  mostForceLabel.setText(upperForceLimit + " 0.00");
  leastSpeedLabel.setText(lowerSpeedLimit + " 0.00");
  mostSpeedLabel.setText(upperSpeedLimit + " 0.00");
  leastMassLabel.setText(lowerMassLimit + " 0.00");
  mostMassLabel.setText(upperMassLimit + " 0.00");
  
  dets.setText(detsText + paperNumber);
  dets.setTextBold();
}

void createEmitter() {
  emitter = new InkerEmitter(Integer.parseInt(nOI.getText()), leastMassSlider.getValueF(), mostMassSlider.getValueF(), leastForceSlider.getValueF()
                             , mostForceSlider.getValueF(), leastSpeedSlider.getValueF(), mostSpeedSlider.getValueF(), 0.5, width, height, true);
  
  println(leastMassSlider.getValueF() + " " + mostMassSlider.getValueF() + " " + leastForceSlider.getValueF()
                              + " " + mostForceSlider.getValueF() + " " + leastSpeedSlider.getValueF() + " " + mostSpeedSlider.getValueF());
}

void setDrawSurface() {
  for (int i = 0; i < papers.length; i++) {
    papers[i] = new PImage(width, height);
  }
  
  brushes[0] = new Spray(papers[0], emitter, 3, color(255), 0, 1);
  brushes[1] = new Spray(papers[1], emitter, 3, color(255, 0, 0), 0, 5);
  brushes[2] = new Spray(papers[2], emitter, 3, color(0, 0, 255), 0, 10);
  brushes[3] = new Spray(papers[3], emitter, 3, color(0, 255, 0), 0, 15);
}