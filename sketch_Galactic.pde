ArrayList <Particles> p=new ArrayList<Particles>();
int counter=0;
float s=50;
public void setup(){
  size(600,600);
  frameRate(120);
  background(255);
  ini();
}
public void draw(){
  translate(width/2,height/2);
   noStroke();
  //float e=map(mv,0,2,1.35,1.41);
  float e=1.41f;
  strokeWeight(2);
  for(float i=20;i>13;i-=0.8f){
    fill(map(i,13,20,20,255));
    //strokeWeight(map(i,10,20,5,0.2)*e);
    //ellipse(0,0,pow(e,i),pow(e,i));
    rectMode(CENTER);
    //rect(0,0,pow(e,i),pow(e,i));
  }   
  //blendMode(MULTIPLY);
  rectMode(CENTER);
  noStroke();
  fill(255,255,255,20);
  rect(0,0,width,height);

  //background(255);

  gravity();
 
  counter++;
  float mv=sin(counter/s)+1;
  //saveFrame();
  
  //noLoop();
  //noFill();
  //stroke(0);
 
}
public void ini(){
  float e=1.41f;
  float rad;
  int np=10;
  int ll=8;
  int ul=15;
  float fac=0.2;
  //strokeWeight(2);
  for(float i=ul;i>ll;i-=0.8){
    rad=pow(e,i);
    np=int(map(rad,pow(e,ll),pow(e,ul),5,40));
    for(int j=0;j<np;j++){
      p.add(new Particles(rad,rad*cos(map(j,0,np,0,2*PI)),rad*sin(map(j,0,np,0,2*PI)),pow(-1,j)*fac*rad*cos(map(j,0,np,0,2*PI)-PI/3),pow(-1,j)*fac*rad*sin(map(j,0,np,0,2*PI)-PI/3),pow(e,ul),pow(e,ll)));
    }
  }
}
public void gravity(){
  for(Particles pp:p){
    PVector fo=new PVector(pp.pos.x,pp.pos.y);
    fo.mult(-1);
    fo.add(new PVector(pp.vel.x,pp.vel.y));
    //fo.mult(-0.1);
    pp.force(fo);
    pp.update();
    pp.rndr();
  }
}
