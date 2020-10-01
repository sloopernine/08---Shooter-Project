// Robin B
class SpaceDust extends GameObject{
	
	Animation animation;

	float speed;

	SpaceDust(){
		super();

		active = false;
		animation = new Animation(2, 2, "dustLineAnim", 80);
	}

	void Update(){

		if(position.y > height + 5){

			animation.Stop();
			active = false;
		} else {

			animation.Loop(position.x, position.y);
			position.y += speed * deltaTime;
		}
	}
}