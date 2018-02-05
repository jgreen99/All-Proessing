//The rectangle class that doesn't extend from anything.
class Rectangle {
  //Declared 4 floats: an x, y, w and h. Set them to nothing right now.
  float x;
  float y;
  float w;
  float h;
  //The rectangle function with 4 parameters: an x, y, w and h.
  //I also used this.x, this.y, this.w and this.h and set them to x, y, w, and h.
  Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
  }
  //This boolean checks to see if the Frog intersects with an object.
  //It should not return what is said in lines 29-32.
  boolean intersects(Rectangle other) {
    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;

    float oleft = other.x;
    float oright = other.x + other.w;
    float otop = other.y;
    float obottom = other.y + other.h;

    return !(left >= oright ||
      right <= oleft ||
      top >= obottom ||
      bottom <= otop);
  }
}