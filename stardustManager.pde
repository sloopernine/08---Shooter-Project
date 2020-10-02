// Robin B
class StardustManager{
	
	SpaceDust[] spaceDust;
	int dustAmount = 30; 

	StardustManager(){

		spaceDust = new SpaceDust[dustAmount];

		for(int i = 0; i < spaceDust.length; i++){

			spaceDust[i] = new SpaceDust();
		}
	}


	void update(){

		int lottery = (int)random(1, 200);

		if(lottery == 123){

			spawnDust();
		}

		for(int i = 0; i < spaceDust.length; i++){

			if(spaceDust[i] != null){

				spaceDust[i].update();
			}
		}
	}

	void spawnDust(){

		SpaceDust dust = getFreeDust();

		if(dust != null){

			dust.position = new PVector(random(0, width), -5);
			dust.speed = random(20, 30);
			dust.active = true;
		} else {

			println("No free dust to spawn FIX!");	
		}
	}

	SpaceDust getFreeDust(){

		SpaceDust returnValue = null;

		for(int i = 0; i < spaceDust.length; i++){

			if(!spaceDust[i].active){

				return spaceDust[i];
			}
		}

		return returnValue;
	}
}