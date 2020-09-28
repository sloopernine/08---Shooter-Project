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
EnemyManager enemyManager;

public void settings()
{
	size(512, 512);

	playerChar = new Player(width/2, height-height/5);
	enemyManager = new EnemyManager();
}

public void draw()
{
	long currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;
    background(55, 255, 255);

    playerChar.update();
    playerChar.draw();

    enemyManager.Update();

    time = currentTime;

}
public void setup(){


}
class Enemy{

	PVector position;

	int cColor;

	int health;

	float collider;

	float speed = 10;

	boolean alive;

	boolean moveRight;

	Enemy(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		cColor = color(255, 0, 0);
	}

	public void Update(){

		if(moveRight){


		} else {


		}
	}

	public void Draw(){
	
		fill(cColor);
		ellipse(position.x, position.y, collider, collider);
	}
}





class EnemyManager{

	Enemy[] enemies;
	int numberOfEnemies = 20;

	EnemyManager(){

		Setup();
	}

	public void Setup(){
		
		enemies = new Enemy[numberOfEnemies];

		for(int i = 0; i < enemies.length; i++){

			enemies[i] = new Enemy(i * 5, 0);
		}
	}

	public void Update(){
	
		for(int i = 0; i < enemies.length; i++){

			
			enemies[i].Draw();
		}
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
}

public void keyReleased()
{
	if (key == 'a')
		moveLeft = false;
	else if (key == 'd')
		moveRight = false;
}
class Player
{

PVector velocity;
PVector charLocation;
float topSpeed = 7;
float decelerationSpeed = 0.85f;
int ballDiameter = 20;
float xInput = 0;
float yInput = 0;
float v = 1;

public Player(int x, int y)
{
	//ellipseMode(CENTER);
	charLocation = new PVector(x, y);

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
  charLocation.y = constrain(charLocation.y, 0+ballDiameter/2, height-ballDiameter/2);
  charLocation.x = constrain(charLocation.x, 0+ballDiameter, width-ballDiameter);

  //Limits the velocity vector and adds to vector to the character location vector.
  velocity.limit(topSpeed);
  charLocation.add(velocity);
}

public void draw()
{
	fill(255, 255, 255);
	ellipse(charLocation.x, charLocation.y, ballDiameter, ballDiameter);
}

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
