/* Louis Christodoulou (louis -at- louisc.co.uk)

Very quickly thrown together code whilst learning how the 
geomerative library ticks. 

Full Writeup on the Blog here:  http://louisc.co.uk/?p=2623
*/

import geomerative.*;

RShape wave;

float movement=0;
float plusminus = 5.0;
RShape person = new RShape();

float scale = 3;

void setup()
{
  // From the examples we must always initialise the library using this command
  RG.init(this);
  
  //Usual Processing Jazz
  size(800 ,600);
  background(255);
  frameRate(25);
  
  //Set up a little for the look and feel
  //fill(255, 102, 0);
  stroke(0);
  strokeWeight(2);
 
  //Define our stick persons Head and Body
  person.addShape(RShape.createCircle(100*scale, 50*scale, 50*scale));
  person.addMoveTo(100*scale, 75*scale);
  person.addLineTo(100*scale, 150*scale);
 
}

void draw(){
  //Blank Background each frame
  background(255);
  
  //Iterate our movement variable for animation
  movement += plusminus;
  
  //Create a new RShape each frame
  RShape wave = new RShape();
  
  //At the moment the wave object is empty, so lets add a curve:
  wave.addMoveTo(0*scale, 100*scale);
  wave.addBezierTo(0*scale, 100*scale, 50*scale, (25+movement)*scale, 100*scale, 100*scale);
  wave.addBezierTo(100*scale, 100*scale, 150*scale, (175-movement)*scale, 200*scale, 100*scale); 
   
  //Lets start to draw away from the edges
  translate(30*scale,0*scale);
  
  //Draw our wave and person
  noFill();
  stroke(0);
  strokeWeight(1*scale);
  wave.draw();
  person.draw();
  
  //Draw our bezier handle lines
  strokeWeight(0.5*scale);
  line(0*scale,100*scale,50*scale,(25+movement)*scale);
  line(150*scale,(175-movement)*scale,200*scale,100*scale);
  
  //Finally draw our defined control points
  strokeWeight(5*scale);
  stroke(0, 255, 0); //Green
  point(0*scale,100*scale);
  stroke(0, 0, 255); //Blue
  point(50*scale,(25+movement)*scale);
  point(150*scale,(175-movement)*scale);
  stroke(255, 0, 0); //Red
  point(200*scale,100*scale);
  
  
  //If we are at the top of our movement, reverse the directing by 
  //changing the plusminus variable
  if(movement > 150)
  {
    plusminus = -5;
  }else if( movement <= 0)
  {
    plusminus = 5;
  }

}