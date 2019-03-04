float radius,radiusSeconds,radiusMunites,radiusHour;
float cy;
float cx;
float diameter;
void setup(){
  //size(500,400);
  fullScreen();
  radius=min(width,height)/2;
  radiusSeconds=radius*0.70;
  radiusMunites=radius*0.50;
  radiusHour=radius*0.40;
  diameter=radius*1.70;
  cx=width/2;
  cy=height/2;
  
  
  

}
void draw(){
  
  background(127,255,0);
  noStroke();
  fill(255,127,0);
  ellipse(cx,cy,diameter,diameter);
  
  float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m=map(minute()+norm(second(),0,60),0,60,0,TWO_PI)-HALF_PI;
  float h=map(hour()+norm(minute(),0,60),0,24,0,TWO_PI*2)-HALF_PI;
  stroke(255);
  strokeWeight(1);
  line(cx,cy,cx+cos(s)*radiusSeconds,cy+sin(s)*radiusSeconds);
  strokeWeight(2);
  line(cx,cy,cx+cos(m)*radiusMunites,cy+sin(m)*radiusMunites);
  strokeWeight(4);
  line(cx,cy,cx+cos(h)*radiusHour,cy+sin(h)*radiusHour);
  
  strokeWeight(2);
  beginShape(POINTS);
  int step=0;
  int tick=0;
  int[] nums={4,5,6,7,8,9,10,11,12,1,2,3};
  for(int a=0;a<=360;a+=6){
    step++;   

    float x=cx+cos(radians(a))*radiusSeconds;
    float y=cy+sin(radians(a))*radiusSeconds;
    if(step==6){
        
        float text=map(a,0,72,0,12);
        strokeWeight(0);
        textSize(15);
        fill(255);
        text(nums[tick],x-5,y+5);
        tick++;
      
    step=1;
  }else{strokeWeight(2);}

    vertex(x,y);
    
    
  }
  
  endShape();
  
  

}