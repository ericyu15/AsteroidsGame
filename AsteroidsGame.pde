//your variable declarations here
Spaceship lucky = new Spaceship();
Star little[] = new Star[150];
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
ArrayList <Bullet> bang = new ArrayList <Bullet>();
public void setup() 
{
  //your code here
  size(600,600);
  lucky.setX(300);
  lucky.setY(300);
  lucky.setmyColor(250);
  for(int i = 0;i < little.length; i++)
  {
    little[i] = new Star();
  }
  for(int n = 0; n < 25; n++)
  {
    rock.add(new Asteroid());
  }
}
public void draw() 
{
  //your code here
  background(0);
  for(int i = 0;i < little.length; i++)
    little[i].show();
  for(int n = 0; n < rock.size(); n++)
  {
    rock.get(n).show();
    rock.get(n).move();
    if(dist(lucky.getX(), lucky.getY(), rock.get(n).getX(), rock.get(n).getY()) < 20)
      rock.remove(n);
  }
  for (int i = 0; i < bang.size(); i++)
  {
    bang.get(i).move();
    bang.get(i).show();
    if (bang.get(i).getX() > 600 || bang.get(i).getX() < 0 || bang.get(i).getY() < 0 || bang.get(i).getY() > 600) 
    {
      bang.remove(i);
      i--;
    }
  }
  lucky.show();
  lucky.move();
}
public void keyPressed()
{
  if(keyCode == 38)
    lucky.accelerate(0.3);
  if(keyCode == 40)
    lucky.accelerate(-0.4);
  if(keyCode == 37)
    lucky.rotate(-20);
  if(keyCode == 39)
    lucky.rotate(20);
  if(keyCode == 90)
  {
    lucky.setDirectionX(0);
    lucky.setX((int)(Math.random()*601));
    lucky.setDirectionY(0);
    lucky.setY((int)(Math.random()*601));
    lucky.setPointDirection((int)(Math.random()*360));
  }
  if(keyCode == 88)
  lucky.shoot();
}
class Spaceship extends Floater  
{   
    //your code here
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
    public void setmyColor(int c){myColor = c;}
    public int getmyColor(){return (int)myColor;}
    public Spaceship()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -2;
      yCorners[3] = 0;
      setmyColor(250);
    }
    public void shoot()
    {
      bang.add(new Bullet(lucky.getX(), lucky.getY(), lucky.getPointDirection(), lucky.getDirectionX(), lucky.getDirectionY()));
    }
}
class Bullet extends Floater
{
  public Bullet(int x, int y, double pointDirection, double directionX, double directionY)
  {
    corners = 4;
    xCorners = new int[4];
    yCorners = new int[4];
    xCorners[0] = 2;
    yCorners[0] = 0;
    xCorners[1] = 0;
    yCorners[1] = 2;
    xCorners[2] = -2;
    yCorners[2] = 0;
    xCorners[3] = 0;
    yCorners[3] = -2;
    myColor = color(255);
    myCenterX = x;
    myCenterY = y;
    myPointDirection = pointDirection;
    myDirectionX = directionX;
    myDirectionY = directionY;
    accelerate(5);
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
  }
}
class Asteroid extends Floater
{
  public Asteroid()
  {
    myCenterX = (int)(Math.random()*601);
    myCenterY = (int)(Math.random()*601);
    rotSpeed = (int)(Math.random()*3)-1;
    myDirectionX = (Math.random()*6)-3;
    myDirectionY = (Math.random()*6)-3;
    corners = 6;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 12;
      yCorners[0] = 0;
      xCorners[1] = 6;
      yCorners[1] = -12;
      xCorners[2] = -6;
      yCorners[2] = -12;
      xCorners[3] = -12;
      yCorners[3] = 0;
      xCorners[4] = -6;
      yCorners[4] = 12;
      xCorners[5] = 6;
      yCorners[5] = 12;
      myColor = color(250);
  }
  private int rotSpeed;
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}
class Star
{
    private int myX, myY, myColor;
    public Star()
    {
      myColor = 250;
      myX = (int)(Math.random()*601);
      myY = (int)(Math.random()*601);
    } 
    public void show()
    {
      noStroke();
      fill(myColor);
      ellipse(myX,myY,3,3);
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 


