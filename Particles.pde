class Particles{
  PVector pos;
  PVector vel;
  PVector acc;
  float ll=2;
  float ul=4;
  float maxvel;
  Particles(float r,float xx, float yy, float xv, float yv,float u,float l){
    pos=new PVector(xx,yy);
    vel=new PVector(xv,yv);
    acc=new PVector(0,0);
    maxvel=random(ll,ul);
    maxveladj(4);
  }
  public void maxveladj(int d){
    int mv=PApplet.parseInt(map(maxvel,ll,ul,0,100));
    int dv=100/d;
    for(int i=1;i<=d;i++){
      if(mv<=i*dv){
        maxvel=map(i*dv,0,100,ll,ul);
        return;
      }
    }
  }
  public void force(PVector f){
    f.limit(0.07f);
    acc.add(f);
  }
  public void update(){
        vel.add(acc);
        vel.limit(maxvel);
        pos.add(vel);
    acc.mult(0);
  }
  public void rndr(){
    noStroke();
    fill(map(maxvel,ll,ul,10,50));
    ellipse(pos.x,pos.y,map(maxvel,ll,ul,25,5),map(maxvel,ll,ul,25,5));
  }
}
