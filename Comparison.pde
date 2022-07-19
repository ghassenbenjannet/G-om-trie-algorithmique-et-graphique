public class Comparison implements Comparator<Rect> {
  public Comparison() {
  }

  public int compare(Rect r1,Rect r2) {
    if (r1.p1.x >r2.p1.x ) {
      return 1;
    } 
    else if (r1.p1.x < r2.p1.x) {
      return -1;
    } 
    else { // x component is the same, check y
      if (r1.p1.y > r2.p2.y) {
        return 1;
      } 
      else {
        return -1;
      }
    }
  }
}
