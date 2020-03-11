class PipeSet {
	private float tall;
	private float fat;
	private float gap;
	private float xVal;
	
	public PipeSet(float g, float h, float w){
		gap = g;
		tall = h;
		fat = w;
		xVal = 600;
	}
	
	public float getHeight(){
		return tall;
	}
	
	public float getWidth(){
		return fat;
	}
	
	public float getGap(){
		return gap;
	}
	
	public float getX(){
		return xVal;
	}

	
	public void setX(float x){
		xVal = x;
	}

  public void tick(){
    this.xVal-=6; 
  }
}
