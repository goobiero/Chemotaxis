 //declare bacteria variables here   
 Bacteria[] ball = new Bacteria[100];

 void setup()   
 {     
 	//initialize bacteria variables here 
 	size(200,200); 
 	background(5,25,25);
 	for(int i = 0; i < ball.length; i++){
 		ball[i] = new Bacteria((int)(99 + Math.random()*5)-2 ,200);
 	}
 }  


 void build(){
  	for(int i = 0; i < ball.length; i++){
  		ball[i] = new Bacteria(ball[i].sX, ball[i].sY);
  	}
 }

 	 
 void draw()   
 {    
 	//move and show the bacteria 
 	for(int s = 0; s < ball.length; s++){
 		if(ball[s].sY > 100){
 			ball[s].branch(0,0);
 		}else if(ball[s].sY <= 100 && ball[s].sY > 50 ){
 			ball[s].branch(13,6);
 		}else if( ball[s].sY <= 50 && ball[s].sY > 20){
 			ball[s].branch(25,12);
 		}else if (ball[s].sY <= 20 && ball[s].sY >= 0){
 			ball[s].branch(7,3);
 		} 	
 	}

 	for(int i = 0; i < ball.length; i++){
 		if(ball[i].sY >= 0){
 			ball[i].move();
 		}
 	}
 	build();  
 }



 class Bacteria    
 {     
 	//lots of java! 
 	int x,y; // change
 	int sX,sY; // initals
 	int col;

 	Bacteria(int setX,int setY){
 		sX = setX;
 		sY = setY;
 		y = 1;
 		if( sY < 100){
 			col = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		}else{
 			col = color(255,0,0);
 		}
  	} 

  	void branch(int range, int shift){
  		x = (int)(Math.random()*range) - shift;
  	}
 	

 	void move(){
 		sX = sX + x;
 		sY = sY - y;
 		fill(col);
 		ellipse(sX, sY, 2, 2);
 	} 
 }    