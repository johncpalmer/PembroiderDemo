import processing.embroider.*;

PEmbroiderGraphics E;
PShape mySvgImage;

void setup() {
  // adding a couple extra units of space so that nothing is out of bounds
  // original SVG is 600 x 62
  int myWidth = 400;
  int myHeight = 41;
  int myScale = 2;
  int usedWidth = myScale * myWidth;
  int usedHeight = myScale * myHeight;
  int gap = 25; 
  size(804, 535);  
  noLoop();
  
  E = new PEmbroiderGraphics(this, width, height);
  String outputFilePath = sketchPath("AREA_variations.pes");
  E.setPath(outputFilePath); 
  
  PShape mySvgImage = loadShape("area.svg");
  E.fill(0,0,0);
  E.stroke(0,0,0); 
  E.strokeWeight(1);
  E.hatchSpacing(3); // 4 was slightly too much space
  E.setStitch(5, 15, 0); // (minLength, desiredLength, noise);
  
  E.hatchMode(E.PARALLEL);
  E.hatchSpacing(3); // 4 was slightly too much space
  E.setStitch(5, 15, 0); // (minLength, desiredLength, noise);
  E.shape(mySvgImage,1,1,usedWidth,usedHeight);
  
  E.hatchMode(E.PARALLEL);
  E.hatchSpacing(2); // 4 was slightly too much space
  E.setStitch(5, 10, 0); // (minLength, desiredLength, noise);
  E.shape(mySvgImage,1,1+1*(usedHeight+gap),usedWidth,usedHeight);
  
  E.hatchMode(E.PARALLEL);
  E.hatchSpacing(3); // 4 was slightly too much space
  E.setStitch(5, 15, 5); // (minLength, desiredLength, noise);
  E.shape(mySvgImage,1,1+2*(usedHeight+gap),usedWidth,usedHeight);
  
  E.hatchMode(E.CROSS);
  E.setStitch(5, 15, 0); // (minLength, desiredLength, noise);
  E.shape(mySvgImage,1,1+3*(usedHeight+gap),usedWidth,usedHeight);
  
  E.hatchMode(E.CROSS);
  E.setStitch(5, 10, 0); // (minLength, desiredLength, noise);
  E.shape(mySvgImage,1,1+4*(usedHeight+gap),usedWidth,usedHeight);

  //-----------------------
  E.optimize(); // slow, but good and very important
  E.visualize();
  E.endDraw(); // write out the file
  save("PEmbroider_svg_image.png"); //saves a png of design from canvas
}


//--------------------------------------------
void draw() {
  ;
}



//void setup() {

//  // Starting up:
//  noLoop();
//  size(800, 600);
//  E = new PEmbroiderGraphics(this, width, height);
//  String outputFilePath = sketchPath("filename.dst");
//  E.setPath(outputFilePath); 
//  E.beginDraw();
//  E.clear();

//  //-------
//  // Content goes here:
//  E.fill(0, 0, 0); 
//  PShape mySvgImage = loadShape("area.svg");
//  E.fill(0,0,0);
//  E.shape(mySvgImage,
//  E.circle(200, 200, 200); 

//  //----------  
//  // Visualization and export:
//  // NOTE: Leave optimize() and endDraw() commented out,
//  // until you are ready to export the embroidery file! 
//  // Don't forget to un-comment them when you want to export!
//  //
//  // E.optimize(); // VERY SLOW, but essential for file output! 
//  E.visualize();   // Display the embroidery path on-screen.
//  // E.endDraw();  // Actually writes out the embroidery file.
//}
