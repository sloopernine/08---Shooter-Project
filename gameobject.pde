class GameObject{
	
	PVector position;
	PVector velocity;
	PVector direction;

	color baseColor;

	float collider;

	boolean active;

	GameObject(){

		position = new PVector(0, 0);
		velocity = new PVector(0, 0);
		direction = new PVector(0, 0);

		active = true;
	}

	boolean Collision(GameObject obj){

  		float maxDistance = obj.collider + collider;

  		if(abs(obj.position.x - position.x) > maxDistance ||  
	   		abs(obj.position.y - position.y) > maxDistance){
	    	
	    	return false;
	  	} else if(dist(obj.position.x, obj.position.y, position.x, position.y) > maxDistance){
	    
	    	return false;
		} else {
		
			return true;
  		}
	}

	void SetDirection(PVector dir){

		direction = dir;
	}
}