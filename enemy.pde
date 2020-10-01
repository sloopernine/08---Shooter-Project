// Robin B
class Enemy extends Character{

	//Animation animation;

	PImage sprite;

	float collider = 64;

	float xSpeed = 40;
	float ySpeed = 10;

	boolean alive;

	Enemy(float xPos, float yPos){
		super();

		sprite = loadImage("data/sprites/enemy1.png");

		position = new PVector(xPos, yPos);
		baseColor = color(255, 0, 0, 50);

		alive = true;

		//animation = new Animation(2, 2, "enemy1Anim", 32);
	}

	void Update(){

		if(alive){

			position.x += (direction.x * xSpeed) * deltaTime;
			position.y += ySpeed * deltaTime;
		}
	}

	void Draw(){
		
		if(alive){

			if(sprite == null){

				fill(baseColor);
				ellipse(position.x, position.y, collider, collider);

			} else {

				//animation.Loop(position.x, position.y);
				image(sprite, position.x - 16, position.y - 16);

				if(debug){

					fill(baseColor);
					ellipse(position.x, position.y, collider, collider);
				}
			}
		}
	}
}





