class Enemy{

	PVector position;

	color cColor;

	int health;

	float collider = 30;

	float ySpeed = 10f;

	boolean alive;

	Enemy(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		cColor = color(255, 0, 0);
	}

	void Update(){

		position.y += ySpeed * deltaTime;
	}

	void Draw(){
	
		fill(cColor);
		ellipse(position.x, position.y, collider, collider);
	}
}





