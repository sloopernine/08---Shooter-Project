// Robin B
class SceneManager{
	
	StarLine[] starLine;
	int starLineAmount = 10; 

	SceneManager(){

		setupStarLines();
	}


	void update(){


		starLineUpdate();
	}

	void setupStarLines(){

		starLine = new StarLine[starLineAmount];

		for(int i = 0; i < starLine.length; i++){

			starLine[i] = new StarLine();

			starLine[i].position = new PVector(random(10, width - 10), random(10, height - 10));
			starLine[i].speed = random(20, 30);
			starLine[i].active = true;
		}
	}

	void starLineUpdate(){

		spawnStarLine();

		for(int i = 0; i < starLine.length; i++){

			if(starLine[i] != null){

				starLine[i].update();
			}
		}
	}

	void spawnStarLine(){

		StarLine line = getFreeStarLine();

		if(line != null){

			if(line.active == false){

				line.position = new PVector(random(0, width), -5);
				line.speed = random(20, 30);
				line.active = true;
			}
		}
	}

	StarLine getFreeStarLine(){

		StarLine returnValue = null;

		for(int i = 0; i < starLine.length; i++){

			if(!starLine[i].active){

				return starLine[i];
			}
		}

		return returnValue;
	}
}