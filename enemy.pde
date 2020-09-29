class Enemy extends Character{

	PImage sprite;

	float collider = 30;

	float xSpeed = 40;
	float ySpeed = 10;

	boolean alive;

	Enemy(float xPos, float yPos){
		super();

		sprite = loadImage("data/sprites/shipBase.png");

		position = new PVector(xPos, yPos);
		baseColor = color(255, 0, 0);

		alive = true;
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

				image(sprite, position.x - 16, position.y - 16);
			}
		}
	}
}





