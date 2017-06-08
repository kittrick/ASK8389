// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;
int resolution = 50;
int stripeW = 50;
float music;
float volume = 70;
ArrayList<Stripe> stripes;
ArrayList<Wander> wanderers;
int wanderCount = 3;
boolean useMouse = false;
boolean usePixels = false;

void setup() {
  //size(448, 512);
  size(600, 800);
  
  // Setup Vars
  stripes = new ArrayList<Stripe>();
  wanderers = new ArrayList<Wander>();
  
  // Wanderers
  for(int i=0; i < wanderCount; i++){
    wanderers.add(new Wander(i));
  }
  
  // Defining Stripe position manually for ease of positioning
  PVector loc = new PVector(width/2+stripeW*2, -20);
  int idx = 0;
  rgbStripe(loc, idx++);
  
  loc = new PVector(width/3+stripeW*2, -20);
  rgbStripe(loc, idx++);
  
  loc = new PVector(width/3*2+stripeW*2, -20);
  rgbStripe(loc, idx++);
  
  // Minim stuff
  minim = new Minim(this);
  track = minim.loadFile("PassionHifi.wav", 1024);
  track.loop();
}

void draw() {
  // Clear Screen
  background(0);
  
  // Wanderers
  if(useMouse == false){
    for(int i=0; i < wanderers.size(); i++){
      wanderers.get(i).update().display();
    }
  } else {
    stroke(255,0,0);
    strokeWeight(5);
    blendMode(BLEND);
    fill(0);
    ellipse(mouseX, mouseY, 30, 30);
    strokeWeight(1);
    noStroke();
    blendMode(ADD);
  }
  
  // Display each stripe
  for(int i = 0; i < stripes.size(); i++){
    blendMode(ADD);
    stripes.get(i).display();
    blendMode(BLEND);
  }
  fill(0);
  stroke(255);
  strokeWeight(50);
  if(usePixels) blackStripes();
  
  fill(255);
  text("Moouse: UP",20,20);
  text("Wanderers: DOWN",20,40);
  text("Pixels On: RIGHT",20,60);
  text("Pixels Off: LEFT",20,80);
  noFill();
}

void rgbStripe(PVector loc, int idx){
  stripes.add(new Stripe(loc, resolution, stripeW, color(255,0,0), idx++));
  stripes.add(new Stripe(loc, resolution, stripeW, color(0,255,0), idx++));
  stripes.add(new Stripe(loc, resolution, stripeW, color(0,0,255), idx++));
}

void blackStripes(){
  strokeWeight(2);
  for(int y = 0; y < height; y+=4){
    stroke(0);
    strokeWeight(2);
    line(0,y, width, y);
    noStroke();
  }
  
  for(int x = 0; x < width; x+=4){
    stroke(0);
    strokeWeight(2);
    line(x,0, x, height);
    noStroke();
  }
  strokeWeight(1);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      useMouse = true;
    } else if (keyCode == DOWN) {
      useMouse = false;
    } else if (keyCode == LEFT) {
      usePixels = false;
    } else if (keyCode == RIGHT) {
      usePixels = true;
    } 
  }
}