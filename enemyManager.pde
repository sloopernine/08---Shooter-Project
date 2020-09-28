class EnemyManager{

	Enemy[][] enemies;
	int enemiesPerLine = 8;
	int numberOfRows = 10;

	int xSpaceOffset = 60;
	int yOffset = 500;

	float xPosWall = 20;
	float xPos = width/2;

	EnemyManager(){

		Setup();
	}

	void Setup(){
		
		enemies = new Enemy[enemiesPerLine][numberOfRows];

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				enemies[x][y] = new Enemy((x * xSpaceOffset) + width/2 - enemiesPerLine * xSpaceOffset / 2, (y * xSpaceOffset) - yOffset);
			}
		}
	}

	void Update(){

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				enemies[x][y].Update();
				enemies[x][y].Draw();
			}
		}
	}
}