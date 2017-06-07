// Audio Vars
import ddf.minim.*;
Minim minim;
AudioPlayer track;
int stripeCount;
int resolution = 50;
int stripeW = 50;
float music;
ArrayList<Stripe> stripes;

void setup() {
  //size(448, 512);
  size(600, 800);
  
  // Setup Vars
  stripeCount = 3;
  stripes = new ArrayList<Stripe>();
  for(int i = 0; i < stripeCount; i++){
    PVector loc = new PVector(width/2, 0);
    stripes.add(new Stripe(loc, resolution, stripeW));
  }
  
  // Minim stuff
  minim = new Minim(this);
  track = minim.loadFile("The Passion HiFi - Gotta Get Up.wav", 1024);
  track.loop();
}

void draw() {
  // Clear Screen
  background(0);
  
  // Get level of Left track
  music = track.left.get(0);
  
  // Display each stripe
  for(int i = 0; i < stripeCount; i++){
    stripes.get(i).display();
  }
  fill(0);
  stroke(255);
  strokeWeight(50);
}