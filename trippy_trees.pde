// animation of trippy trees
// inspired by the breathing life of the Arb and the fall leaves
// by Flo Wong
// October 2016

// --------------- INITIALIZE VARIABLES --------------- \\

Sky sky;
Moon moon;
Land land;
ArrayList<Tree> trees;
int trees_count = 50;

// --------------- SETUP --------------- \\

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  frameRate(30);
  smooth();
  
  // ---------- Sky ----------- \\
  sky = new Sky();
  
  
  // ---------- Land ---------- \\
  land = new Land();
  
  
  // ---------- Moon ---------- \\
  moon = new Moon();
  
  
  // ---------- Trees ---------- \\
  trees = new ArrayList<Tree>();
  
  // establish random location coordinates for trees
  for (int i = 0; i < trees_count; i+=1) {
    int tree_x = int(random(0, 500));
    int tree_y = int(random(170, 300));
    // maybe use some sort of parabola function for tree_y: 150 to (200 to 300) to 400
    trees.add(new Tree(tree_x, tree_y));
  }
}

void draw() {
  
  // --------------- SKY --------------- \\
  sky.transition();
  sky.display();
  
  // --------------- MOON --------------- \\
  moon.move();
  moon.shrink();
  moon.pulsateSize();
  moon.pulsateColor();
  moon.display();

  // --------------- GREEN LAND PASTURE --------------- \\
  land.pulsateColor();
  land.pulsateSize();
  land.display();

  // --------------- TREES --------------- \\
  
  // traverse through trees
  for (int i = 0; i < trees_count; i+=1) {
    Tree tree = trees.get(i);

    tree.pulsate();
    
    tree.display();
  }
  
  // draw gif (http://stackoverflow.com/questions/22124039/exporting-a-gif-from-a-processing-sketch-w-gif-animation-library)
  if(frameCount <= 120) {
    TImage frame = new TImage(width,height,RGB,sketchPath("frame_"+nf(frameCount,3)+".png"));
    frame.set(0,0,get());
    frame.saveThreaded();
  }
  
}

/*
// --------------- class TImage for gif --------------- \\
class TImage extends PImage implements Runnable{//separate thread for saving images
  String filename;

  TImage(int w,int h,int format,String filename){
    this.filename = filename;
    init(w,h,format);
  }

  public void saveThreaded(){
    new Thread(this).start();
  }

  public void run(){
    this.save('frames/'+filename);
  }

}
*/