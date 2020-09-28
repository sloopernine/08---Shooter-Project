class Enemy{

	PVector position;

	color cColor;

	int health;

	float collider;

	float speed = 10;

	boolean alive;

	boolean moveRight;

	Enemy(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		cColor = color(255, 0, 0);
	}

	void Update(){

		if(moveRight){


		} else {


		}
	}

	void Draw(){
	
		fill(cColor);
		ellipse(position.x, position.y, collider, collider);
	}
}





