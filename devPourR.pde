ArrayList<Rect> diviser(ArrayList<Rect> listeRec,int start, int end){
  Collections.sort(listeRec, new Comparison()); //On commence par trier les rectangles
  int taille=end-start; //Le nobmre de rectangles dans l'intervalle
  if (taille <= 3) //S'il y a trop peu de rectangles dans l'inttervalle, on fait du brute force
    return BruteForce(listeRec);

  int mid=taille/2;
  Rect midRect= listeRec.get(mid); //Le rectangle au centre de l'intervalle

  ArrayList<Rect> collisions =new ArrayList<Rect>();
  //Partir Left
  collisions.addAll(diviser(listeRec,start,start+mid));
  //Partie right
  collisions.addAll(diviser(listeRec,start+mid,end));

  int beginSweepLineIndex = -1; // l'index du premier rectangle qui déborde un peu sur la partie droite
  for (int i=start; i <=start+mid;i++) {
    if (listeRec.get(i).p1.x+listeRec.get(i).p2.x >= listeRec.get(start+mid).p1.x) {
      beginSweepLineIndex = i;
    }
  }
  //L'index de fin du sweep-line : 
  int endSweepLineIndex=beginSweepLineIndex=0;
  for (int i=start+mid+1; i< end; i++) {
    //On va aller voir si on a un rectangle à gauche qui peut être en intersection avec le rectangle de droite courant, si on en trouve pas, on peut s'arrêter, c'est à cela que va servir la variable found
    boolean found = false;
    for (int j = beginSweepLineIndex;j<=start+mid;j++) {
      if (listeRec.get(j).p1.x+listeRec.get(j).p2.x >= listeRec.get(i).p1.x) {
        endSweepLineIndex = i;
        found = true;
        break;
      }
    }
    if (!found) break;
  }
  endSweepLineIndex++; //L'index doit être exclu (par exemple, avant on faisait le sweepLine entre 0 et listeRec.size()), c'est pour cette raison que la variable est incrémentée

  for(int i=beginSweepLineIndex;i<endSweepLineIndex-1 ;i++){
   int j = i + 1;
    float med1 =listeRec.get(i).p1.x;
    float med2 =listeRec.get(i).p2.x;
      while (j < listeRec.size() && listeRec.get(j).p1.x>= med1 &&listeRec.get(j).p1.x <= med2) {
       PVector p1_Rec1= new PVector(listeRec.get(i).p1.x,listeRec.get(i).p1.y);
       PVector p2_Rec1= new PVector(listeRec.get(i).p2.x+listeRec.get(i).p1.x,listeRec.get(i).p2.y+listeRec.get(i).p1.y);
       PVector p1_Rec2=new PVector(midRect.p1.x,midRect.p1.y);
       PVector p2_Rec2=new PVector(midRect.p2.x+midRect.p1.x,midRect.p2.y+midRect.p1.y);
       if ((overlap(p1_Rec1,p2_Rec1,p1_Rec2,p2_Rec2))){
        collisions.add(listeRec.get(i));
     } 
   j++;
     }

  } 

  return collisions;
}
