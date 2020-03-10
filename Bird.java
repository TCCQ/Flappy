class Bird {
	private float yVal;
	private float size;
	public Bird (float s, float y){
		yVal = y;
		size = s;
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
}