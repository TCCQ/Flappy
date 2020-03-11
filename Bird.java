class Bird {
	private float yVal;
	private float xVal;
	private float size;
	private float yVelocity;

	public Bird (float s, float y){
		yVal = y;
		size = s;
		xVal = 100;
		yVelocity = -10;
	}
	
	public float getSize(){
		return size;
	}
	
	public float getY(){
		return yVal;
	}
	
	public void setY(float y){
		yVal = y;
	}

  public void setVel(float v){
    yVelocity = v;
  }
	
	public float getX (){
		return xVal;
	}
	
	public void tick(){
		yVal += yVelocity;
    if (yVelocity < 20){
		  yVelocity += 1;
    }	
}
	
	public void jump(){
		yVelocity -= 5;
	}

  public boolean checkCollision(PipeSet p){
     if (Math.abs(this.xVal-p.getX()) < (p.getWidth()/2) && Math.abs(this.yVal-p.getHeight()) > (p.getGap()/2)){
       return true;      
     } else {
       return false; 
     }
  }
}
