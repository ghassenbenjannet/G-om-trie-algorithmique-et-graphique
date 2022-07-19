// Fonction qui cherche l'intersection 
public boolean overlap(PVector l1,PVector r1,PVector l2,PVector r2){
   // If one rectangle is on left side of other
        if ((l1.x >= r2.x || l2.x >= r1.x)) {
            return false;
        }
        // If one rectangle is above other
        if ((l1.y >= r2.y ||l2.y>=r1.y )) {
            return false;
       }  
  return true;
}


//BRUTE FORCE
ArrayList<Rect> BruteForce(ArrayList<Rect> listeRec){
  c_brute=0;
  ArrayList<Rect> retour= new ArrayList<Rect>();
  for(int i=0;i<listeRec.size();i++){
    for(int j=0;j<listeRec.size();j++){
    if (i!=j){  
      PVector p1_Rec1= new PVector(rects.get(i).p1.x,rects.get(i).p1.y);
      PVector p2_Rec1= new PVector(rects.get(i).p2.x+rects.get(i).p1.x,rects.get(i).p2.y+rects.get(i).p1.y);
      PVector p1_Rec2=new PVector(rects.get(j).p1.x,rects.get(j).p1.y);
      PVector p2_Rec2=new PVector(rects.get(j).p2.x+rects.get(j).p1.x,rects.get(j).p2.y+rects.get(j).p1.y);
    if ((overlap(p1_Rec1,p2_Rec1,p1_Rec2,p2_Rec2))){
        c_brute++;
       retour.add(listeRec.get(i));
       retour.add(listeRec.get(j));
      
     }   
    }
   }
  }
  
  return retour;
}
