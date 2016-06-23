import geomerative.*;

RShape wave;

void setup()
{
  // From the examples we must always initialise the library using this command
  RG.init(this);
  
  //Usual Processing Jazz
  size(640 ,380);
  background(255);
  
  //Set up a little for the look and feel
  //fill(255, 102, 0);
  stroke(0);
  strokeWeight(2);
    
  //Now we generate a new RShape object in which to create our wavy shape and 
  //assign its reference as wave
  RShape wave = new RShape();
  
  //At the moment the wave object is empty, so lets add a curve:
  wave.addMoveTo(0, 100);
  wave.addBezierTo(0, 100, 50, 0, 100, 100);
  wave.addBezierTo(100, 100, 150, 200, 200, 100);
  wave.addBezierTo(200, 100, 250, 0, 300, 100);  
   
  //Lets start to draw away from the edges
  translate(width/4, height/4);
  //Draw our wave shape
  wave.draw();
  
  //Create a visual reference for our control points
  textSize(10);
  fill(60);
  text("Y 0", -50, 0);
  text("Y 50", -50, 50);
  text("Y 100", -50, 100);
  text("Y 150", -50, 150);
  text("Y 200", -50, 200);
  
  text("X 0", 0, -50);
  text("X 50", 50, -50);
  text("X 100", 100, -50);
  text("X 150", 150, -50);
  text("X 200", 200, -50);
  text("X 250", 250, -50);
  text("X 300", 300, -50);
  
  strokeWeight(0.5);
  line(0,100,50,0);
  line(150,200,200,100);
  line(200,100,250,0);
  
  strokeWeight(5);
  point(0,100);
  point(50,0);
  point(100,100);
  point(150,200);
  point(200,100);
  
  stroke(0, 255, 0); //Green
  point(200,100);
  stroke(0, 0, 255); //Blue
  point(250,0);
  stroke(255, 0, 0); //Red
  point(300,100);
}

void draw(){
}

void mousePressed()
{
  saveFrame("louisc_co_uk_Geromerative1-######.jpg");
}