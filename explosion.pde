// Robin B
class Explosion extends GameObject{
	
	Animation animation;

	Explosion(){
		super();

		active = false;

		animation = new Animation(4, 4, "expl1", 64);
	}

	void Explode(float xPos, float yPos){

		active = true;
		animation.Play(xPos, yPos);
	}
}