import com.hamoid.*;

String VIDEO_FILE_NAME = "ClockDraw.mp4";

int count = 0;
int startTime;
int interval = 1000;
String s = "";
PFont font;
VideoExport videoExport;

void setup() {
  font = loadFont("ComicSansMS-98.vlw");
  size(800, 600);
  startTime = millis();
  
  videoExport = new VideoExport(this, VIDEO_FILE_NAME);
  videoExport.startMovie();
}

void draw() {
  background(0);
  textFont(font);
  fill(255);
  s = "Timer: " + count;
  text(count, width/2, height/2);

  if (complete()) {
    count++;
    startTime = millis();
  }
  saveVideoWithHamoid();
}

boolean complete() {
  return millis() - startTime > interval;
}

void saveVideoWithHamoid(){
   videoExport.saveFrame();
}
