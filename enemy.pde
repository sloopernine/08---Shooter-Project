class Enemy{

	PVector position;

	int health;

	float collider;

	Enemy(float xPos, float yPos){

		position = new PVector(xPos, yPos);

	}

	void Update(){


	}

	void Draw(){
	
		ellipse(position.x, position.y, collider, collider);
	}
}





