class PipeSet {
	private float height;
	private float width;
	private float gap;
	private float xVal;
	
	public PipeSet(float g, float h, float w){
		gap = g;
		height = h;
		width = w;
		xVal = 0;
	}
	
	public float getHeight(){
		return height;
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
}