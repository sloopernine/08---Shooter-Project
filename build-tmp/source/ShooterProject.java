import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ShooterProject extends PApplet {

float deltaTime;
float time;
Player playerChar;
Bullet bullet;

public void settings()
{
	size(512, 512);
	playerChar = new Player(width/2, height-height/5);
}

public void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(55, 255, 255);

    playerChar.update();
    playerChar.draw();



    time = currentTime;

}

public void shoot()
{
	bullet = new Bullet(PApplet.parseInt(playerChar.position.x), PApplet.parseInt(playerChar.position.y+5));
}
class Player
{

	PVector velocity;
	PVector position;
	float topSpeed = 7;
	float decelerationSpeed = 0.85f;
	int ballDiameter = 20;
	float xInput = 0;
	float yInput = 0;
	float v = 1;

public Player(int x, int y)
{
	//ellipseMode(CENTER);
	position = new PVector(x, y);

	velocity = new PVector(0,0);
	xInput = 0;
    yInput = 0;
}

public void update()
{

  if (moveLeft)
  {
    xInput -= v;
  }
  if (moveRight)
  {
    xInput += v;
  }
  //If there is no player input the xInput will reset to start deceleration.
  if (!moveLeft && !moveRight)
  {
    xInput = 0;
  }
  
  //Creates a acceleration vector with player input and sets the magnitude of that vector.
  PVector acceleration = new PVector(xInput, yInput);
  acceleration.setMag(15f);

  //Deceleration if no input is registered.
  if (xInput == 0)
    velocity.x *= decelerationSpeed;
  else
    velocity.add(acceleration.mult(deltaTime));

  xInput = constrain(xInput, -topSpeed, topSpeed);
  position.y = constrain(position.y, 0+ballDiameter/2, height-ballDiameter/2);
  position.x = constrain(position.x, 0+ballDiameter, width-ballDiameter);

  //Limits the velocity vector and adds to vector to the character location vector.
  velocity.limit(topSpeed);
  position.add(velocity);
}

public void draw()
{
	fill(255, 255, 255);
	ellipse(position.x, position.y, ballDiameter, ballDiameter);
}

}
class Bullet
{
	PVector velocity;
	PVector position;
	float speed = 1;
	
	public Bullet(int x, int y)
	{
		position = new PVector(x, y);

		velocity = new PVector(0, 0);
	}

	public void update()
	{
		position.add(velocity.mult(deltaTime));
	}
}
class enemy{

	PVector position;

	int health;

	public void draw(){
	
	
	}
}





boolean moveRight;
boolean moveLeft;
boolean gravityOn = false;
PVector vectorInput = new PVector(0,0);

public void keyPressed()
{
	if (key == 'a')
		moveLeft = true;
	else if (key == 'd')
		moveRight = true;

	if (key == 'f')
		shoot();
}

public void keyReleased()
{
	if (key == 'a')
		moveLeft = false;
	else if (key == 'd')
		moveRight = false;
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ShooterProject" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
