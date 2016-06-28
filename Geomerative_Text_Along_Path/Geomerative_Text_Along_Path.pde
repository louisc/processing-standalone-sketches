/* Louis Christodoulou (louis -at- louisc.co.uk)

Very quickly thrown together code whilst learning how the 
geomerative library ticks. 

Here we take out previous scripts drawing and placing points along an arc and 
complete our initial idea of placing text along the arc.

Full Writeup on the Blog here: http://louisc.co.uk/?p=2686
*/

import geomerative.*;
RShape wave;
RFont font;

float plusminus =0.0;
float scale = 3;
String message = "hello bendy world  >>>";
int index = 0;

//Somwhere to store our curve points
RPoint[] points;

void setup()
{
  // From the examples we must always initialise the library using this command
  RG.init(this);
  
  //Usual Processing Jazz
  size(800 ,450);
  background(255);
  frameRate(25);
 
  //We wanted a dymo labeller style look, replace this font with your choice
  font = new RFont("Impact Label Reversed.ttf", 72, RIGHT);
}

void draw(){
  //Blank Background each frame
  background(255);
  
  //Create a new RShape each frame
  RShape wave = new RShape();
  
  //At the moment the wave object is empty, so lets add a curve:
  wave.addMoveTo(0*scale, 100*scale);
  wave.addBezierTo(0*scale, 100*scale, 50*scale, 25*scale, 100*scale, 100*scale);
  wave.addBezierTo(100*scale, 100*scale, 150*scale, 175*scale, 200*scale, 100*scale); 
   
  //Lets draw away from the edges
  translate(100,-80);
  
  //Draw our wave
  noFill();
  stroke(0);
  strokeWeight(60);
  strokeCap(PROJECT);
  wave.draw();
  strokeCap(ROUND);
  
  //Collect some points along the curve
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(35);
  points = wave.getPoints();  
  
  index=0; //Letter index within the string message
  
  //Loop through and place a letter at each point
  for(int i=0; i<points.length-1; i++){  
    stroke(0, 90, 255); //Blue
    strokeWeight(5);   
    //point(points[i].x,points[i].y); //Mark Curve Points
    
    stroke(255, 90, 0); //Orange
    strokeWeight(10);
    RPoint center = new RCommand(points[i], points[i+1]).getCenter();
    //point(center.x,center.y); //Mark Center Points
    
    fill(255);
    noStroke();
    
    pushMatrix();
    translate(center.x,center.y);
    rotate(getAngle(points[i], points[i+1]));
    translate(5, 20);
    font.draw(message.charAt(index));
    popMatrix();
    
    index++;

  }

}

//Simple function to calculate the angle between two points
float getAngle(RPoint p1, RPoint p2){
  float deltax = p1.x - p2.x;
  float deltay= p1.y - p2.y;
  
  return atan(deltay/deltax);
}


void mousePressed()
{
  saveFrame("louisc_co_uk_Geromerative2-######.jpg");
}