class Enemy extends Character{

	PVector position;

	float collider = 30;

	float ySpeed = 10f;

	boolean alive;

	Enemy(float xPos, float yPos){
		super();

		position = new PVector(xPos, yPos);
		baseColor = color(255, 0, 0);
	}

	void Update(){

		position.y += ySpeed * deltaTime;
	}

	void Draw(){
	
		fill(cColor);
		ellipse(position.x, position.y, collider, collider);
	}
}





