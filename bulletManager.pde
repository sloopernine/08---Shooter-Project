class bulletManager
{
	//Ansvarig: Johan B
	Bullet[] bullets;
	Player player;

	void setup()
	{
 	   bullets = new Bullet[10];
	}

	void spawnBullet()
	{
		for (int i = 0; i < bullets.length; ++i) 
      	{
        	if (bullets[i] == null) 
        	{
          	bullets[i] = new Bullet(int(player.position.x), int(player.position.y+2));
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
    	  	bullets[i].update();
    	  	bullets[i].draw();
    		}
    	}
	
  		//Spawn new bullet it we press "space-bar"
  		if (keyPressed && key == 32) 
  		{  
      		spawnBullet();
  		}
  	}
}

