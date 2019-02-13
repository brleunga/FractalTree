private double fractionLength = 0.2; 
private int smallestBranch = 12; 
private double branchAngle = 0.55;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(43,66,102);   
	stroke(81,66,31);
	strokeWeight(4);
	line(320,480,320,380);
	drawBranches(320,380,100,3*Math.PI/2);
}
public void mousePressed()
{
	fractionLength = fractionLength + 0.1;
	if (fractionLength > 0.8) {
		fractionLength = 0.2;
	}
	redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	double angle3 = angle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	stroke(0,(int)(Math.random()*175)+80,0);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
}