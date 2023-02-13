
PVector player_Pos;
float player_Speed = 0.3f;
PImage playerSprite;

PVector[] enemy_Pos;
float[] enemies_speed;
PImage enemiesSprite;
int imageSize = 40;


void setup()
{
  frameRate(60);
  //Crear la ventana nos pide dos valores de altura y ancho de la pantalla
  size(800, 600);
  
  //Le ponemos un color al background
  background(255,255,255);
  
  player_Pos = new PVector(width/2 , 0);
  
  enemy_Pos = new PVector[4];
  enemies_speed = new float[4];
  
  for(int i = 0; i < 4; i++)
  {
      enemy_Pos[i] = new PVector(random(0, width) , random(0, height));
  }
  enemies_speed[0] = 0.01;
  enemies_speed[1] = 0.02;
  enemies_speed[2] = -0.001;
  enemies_speed[3] = -0.003;
  
  playerSprite = loadImage("data/FranTetitas.png");
  playerSprite.resize(imageSize,imageSize);
  enemiesSprite = loadImage("data/PauAcosador.png");
  enemiesSprite.resize(imageSize,imageSize);

  
  
}


//El draw es el update
void draw()
{
  //Con esto limpiamos la pantalla
  background(255,255,255);
  CalculatePlayerPos();
  CalculateEnemiesPos();
  CheckCollisions();
  DrawEnemies();
  DrawPlayer();

  
}

void CalculatePlayerPos()
{
    PVector new_player_Pos = new PVector((mouseX - player_Pos.x) * player_Speed,(mouseY - player_Pos.y) * player_Speed);//Calculamos el vector de separacion que hay entre el player y el raton y lo multiplicamos por la velocidad (Aplha)
    player_Pos = new PVector (player_Pos.x + new_player_Pos.x, player_Pos.y + new_player_Pos.y);//Aqui le sumamos el vector anterior a la posicion del player actual para que se mueva    
    
}


void DrawPlayer()
{
    image(playerSprite, player_Pos.x - playerSprite.width / 2, player_Pos.y - playerSprite.height /2);
}

void CalculateEnemiesPos()
{
  

  for(int i = 0; i < 4; i++){
       PVector new_enemy_Pos = new PVector((player_Pos.x - enemy_Pos[i].x) * enemies_speed[i],(player_Pos.y - enemy_Pos[i].y) * enemies_speed[i]); //Calculamos el vector de separacion que hay entre el player y el enemigo y lo multiplicamos por la velocidad (Aplha)
       enemy_Pos[i] = new PVector (enemy_Pos[i].x + new_enemy_Pos.x, enemy_Pos[i].y + new_enemy_Pos.y); //Aqui le sumamos el vector anterior a la posicion del enemigo actual para que se mueva
       if(enemy_Pos[i].x > width - 15)
       {
         enemy_Pos[i].x = width - 15;
       }else if(enemy_Pos[i].x < 15)
       {
         enemy_Pos[i].x = 15;
       }
       
       if(enemy_Pos[i].y > height- 15)
       {
         enemy_Pos[i].y = height - 15;
       }else if(enemy_Pos[i].y < 15)
       {
         enemy_Pos[i].y = 15;
       }
       

  } //<>//
    
    
    
}
void DrawEnemies()
{
  for(int i = 0; i < 4; i++){
       //Dibujamos los puntos       
       image(enemiesSprite, enemy_Pos[i].x - enemiesSprite.width /2 , enemy_Pos[i].y - enemiesSprite.height /2);

  }
}


void CheckCollisions()
{
  PVector v;
  float vectorMagnitude;
    for(int i = 0; i < 4; i++)
    {
       v = new PVector(player_Pos.x - enemy_Pos[i].x, player_Pos.y - enemy_Pos[i].y); //coordenadas del vector
       vectorMagnitude = sqrt(v.x*v.x*v.y*v.y); //Modulo
       //comparar si colionan utilizando el modulo y la suma de los radios
       if(vectorMagnitude <= imageSize * 2)
       {
         println("El " + i + " me la choca");
       }
       else
       {
        println("Dia triste, no hay paja con los pies"); 
       }
       
    }
}
