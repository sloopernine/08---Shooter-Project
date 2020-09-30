class BulletManager
{
	//Ansvarig: Johan B
	Bullet[] bullets;
	Player player;

	BulletManager()
	{
		setup();
	}

	void setup()
	{
 	   bullets = new Bullet[10];
	}

	void spawnBullet(int x, int y)
	{
		for (int i = 0; i < bullets.length; ++i) 
      	{
        	if (bullets[i] == null) 
        	{
          	bullets[i] = new Bullet(x, y);
          	//we are done, break/quit the loop.
          	break;
       		}
		}

	}

	void draw() 
	{
  	//Update bullets
  		for (int i = 0; i < bullets.length; i++) 
  		{
    		if (bullets[i] == null) 
    		{
      		//No bullet, skip to the next one.
      		continue;
    		}
    		else
    		{
    	  //found a bullet, update it.
    	  	boolean hit = enemyManager.CheckCollision(bullets[i]);
    	  	if (hit)
    	  		println("Hit!");
       	  	bullets[i].update();
    	  	bullets[i].draw();
    		}
    	}
		
		for (int i = 0; i < bullets.length; ++i) 
		{
			if(bullets[i] == null)
			{
				continue;
			}
			else
			{
				if (bullets[i].position.y < 0 || bullets[i].position.y > height)
				{
					bullets[i] = null;
				}
			}
		}
  		//Spawn new bullet it we press "space-bar"
  	}
}

