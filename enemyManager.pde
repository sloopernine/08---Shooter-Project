// Robin B
class EnemyManager{

	Enemy[][] enemies;
	PVector[] rowDirection;
	int enemiesPerLine = 8;
	int numberOfRows = 12;
	int enemyPointValue = 10;

	int xSpaceOffset = 70;
	int yOffset = 50 * numberOfRows;

	float xWall = 40;

	float xCenter = width/2;

	EnemyBulletManager enemyBulletManager;

	EnemyManager(){

		Setup();
	}

	void Setup(){
		
		enemyBulletManager = new EnemyBulletManager();
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
				//enemyBulletManager.spawnBullet(int(enemies[x][y].position.x), int(enemies[x][y].position.y));
				//enemyBulletManager.draw();

			}
		}
	}

	boolean CheckCollision(GameObject obj){

		boolean returnValue = false;

		for(int y = 0; y < numberOfRows; y++){
			for(int x = 0; x < enemiesPerLine; x++){

				if(enemies[x][y].alive){

					returnValue = enemies[x][y].Collision(obj);
				}

				if(returnValue){
					gameManager.AddScore(enemyPointValue);
					explosionManager.SpawnExplosion(enemies[x][y].position.x, enemies[x][y].position.y);
					enemies[x][y].alive = false;
					return returnValue;
				} 
					
			}
		}

		return returnValue;
	}
}