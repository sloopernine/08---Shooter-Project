// Robin B
class ExplosionManager{
	
	int amountExplosions = 5;

	Explosion[] explosions;

	ExplosionManager(){

		explosions = new Explosion[amountExplosions];

		for(int i = 0; i < explosions.length; i++){

			explosions[i] = new Explosion();
		}
	}

	void SpawnExplosion(float xPos, float yPos){

		Explosion explosion = GetFreeExplosion();

		if(explosion != null){

			explosion.Explode(xPos, yPos);
		} else {

			println("No free explosion to spawn FIX!");	
		}
	}

	Explosion GetFreeExplosion(){

		Explosion returnValue = null;

		for(int i = 0; i < explosions.length; i++){

			if(!explosions[i].active){

				return explosions[i];
			}
		}

		return returnValue;
	}
}