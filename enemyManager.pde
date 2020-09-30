class EnemyManager{

	Enemy[][] enemies;
	PVector[] rowDirection;
	int enemiesPerLine = 2;
	int numberOfRows = 2;

	int xSpaceOffset = 70;
	int yOffset = 0;//500;

	float xWall = 40;

	float xCenter = width/2;

	EnemyManager(){

		Setup();
	}

	void Setup(){
		
		enemies = new Enemy[enemiesPerLine][numberOfRows];
		rowDirection = new PVector[numberOfRows]; 

		for(int i = 0; i < rowDirection.length; i++){

			rowDirection[i] = new PVector(random(0, 2) - 1, 0);
		}

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				enemies[x][y] = new Enemy((x * xSpaceOffset) + xCenter - enemiesPerLine * xSpaceOffset / 2, (y * xSpaceOffset) - yOffset);
			}
		}
	}

	void Update(){

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				if(x == 0 && enemies[x][y].position.x < xWall){

					rowDirection[y] = new PVector(1, 0);
				}

				if(x == enemiesPerLine-1 && enemies[x][y].position.x > width - xWall){

					rowDirection[y] = new PVector(-1, 0);
				}

				enemies[x][y].SetDirection(rowDirection[y]);
				enemies[x][y].Update();
				enemies[x][y].Draw();
			}
		}
	}

	boolean CheckCollision(GameObject obj){

		boolean returnValue = false;

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				returnValue = enemies[x][y].Collision(obj);
			}
		}

		return returnValue;
	}
}