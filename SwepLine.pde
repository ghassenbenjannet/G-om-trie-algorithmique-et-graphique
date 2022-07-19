ArrayList<Rect> SweepLine(ArrayList<Rect> listeRec){
  ArrayList<Rect> retour_sweep= new ArrayList <Rect>();
  Collections.sort(listeRec, new Comparison());
  for(int i=0;i<listeRec.size()-1 ;i++){
   int j = i + 1;
    float sweepline1 =listeRec.get(i).p1.x;
    float sweepline2 =listeRec.get(i).p2.x+listeRec.get(i).p1.x;
      while (j < listeRec.size() && listeRec.get(j).p1.x>= sweepline1 &&listeRec.get(j).p1.x <= sweepline2) {
      PVector p1_Rec1= new PVector(rects.get(i).p1.x,rects.get(i).p1.y);
      PVector p2_Rec1= new PVector(rects.get(i).p2.x+rects.get(i).p1.x,rects.get(i).p2.y+rects.get(i).p1.y);
      PVector p1_Rec2=new PVector(rects.get(j).p1.x,rects.get(j).p1.y);
      PVector p2_Rec2=new PVector(rects.get(j).p2.x+rects.get(j).p1.x,rects.get(j).p2.y+rects.get(j).p1.y);
     if ((overlap(p1_Rec1,p2_Rec1,p1_Rec2,p2_Rec2))){
       retour_sweep.add(listeRec.get(j));
       retour_sweep.add(listeRec.get(i));     
     } 
   j++;
     }
    
  } 
  return retour_sweep;
  
}
