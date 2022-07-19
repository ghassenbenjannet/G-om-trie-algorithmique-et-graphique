import java.util.Collections;
import java.util.Comparator;
ArrayList<Rect> rects;
ArrayList<Rect> retour;
ArrayList<Rect> retour_sweep;
ArrayList<Rect> retour_dev;
ArrayList<Rect> retour_devv;

int nb=100;


PVector p2,p3,p4;
int c_brute=0;



// génération des rectangles
ArrayList<Rect>genererrectangle(int nombre_rect){
  ArrayList<Rect> listeRect = new ArrayList<Rect>();
  for (int i=0;i<nombre_rect;i++){
     PVector P1 = new PVector(random(0,width-100),random(0,height-100));
     PVector P2 = new PVector(random(5,50),random(5,100));
     Rect rectangle= new Rect(P1,P2);
     listeRect.add(rectangle);
  }
return listeRect;
}



// affichage des rectangles 
void drawRect(ArrayList<Rect> liste_rec,color color_){
  noFill();
  stroke(color_);
  strokeWeight(2);
   for (int i=0;i<liste_rec.size();i++){
    
     rect(liste_rec.get(i).p1.x,liste_rec.get(i).p1.y,liste_rec.get(i).p2.x,liste_rec.get(i).p2.y);
   }
}


void setup(){
  size (1000,1000);
  rects=genererrectangle(nb);
  println("-------------------------------");
  println("Résultat pour ",nb," rectangles");
  println("-------------------------------");

  println("** Brute force **");
  float t0=millis();
  retour =BruteForce(rects);
  float t1=millis();
  println("Nombre d'intersection =",c_brute/2);
  println("Time= ",t1-t0,"ms");

   println("** Sweep Line **");
   float t2=millis();
   retour_sweep=SweepLine(rects);
   float t22=millis();
   println("Nombre intersection = ",retour_sweep.size()/2);
   println("Time= ",t22-t2,"ms");
   
   println("** Divide and Conquer ** ");
  Collections.sort(rects, new Comparison());
   float t00=millis();
   retour_dev=diviser(rects,0,rects.size());
   float t01=millis();
    println("Nombre d'intersection=",retour_dev.size()/24);
    println("Time= ",t01-t00,"ms");
}


void draw(){
  background(255);
  drawRect(rects,color( 0));
  //drawRect(retour,color(255,0, 0));
  // drawRect(retour_sweep,color(255,0, 0));
  drawRect(retour_dev,color(255,0, 0));
}
