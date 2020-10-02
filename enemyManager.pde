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

		setup();
	}


	void setup(){
		
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

	void update(){

		for(int y = 0; y < numberOfRows; y++){

			for(int x = 0; x < enemiesPerLine; x++){

				if(x == 0 && enemies[x][y].position.x < xWall){

					rowDirection[y] = new PVector(1, 0);
				}

				if(x == enemiesPerLine-1 && enemies[x][y].position.x > width - xWall){

					rowDirection[y] = new PVector(-1, 0);
				}

				enemies[x][y].setDirection(rowDirection[y]);
				enemies[x][y].update();
				enemies[x][y].draw();
				enemyBulletManager.draw();
			}
		}
	}

	void shoot(){

		int shootX = int(random(0, enemiesPerLine));
		int shootY = int(random(0, numberOfRows));
		enemyBulletManager.spawnBullet(int(enemies[shootX][shootY].position.x), int(enemies[shootX][shootY].position.y));
	}

	boolean checkCollision(GameObject obj){

		boolean returnValue = false;

		for(int y = 0; y < numberOfRows; y++){

			for(int x = 0; x < enemiesPerLine; x++){

				if(enemies[x][y].alive){

					returnValue = enemies[x][y].collision(obj);
				}

				if(returnValue){

					gameManager.AddScore(enemyPointValue);
					explosionManager.spawnExplosion(enemies[x][y].position.x, enemies[x][y].position.y);
					enemies[x][y].alive = false;
					return returnValue;
				} 
					
			}
		}

		return returnValue;
	}
}