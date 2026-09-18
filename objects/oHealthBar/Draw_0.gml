healthPercent = (oBoss.hp/oBoss.hp_max)*100;
x1 = x -320;   
y1 = y;   
x2 = x + 320;   
y2 = y - 30; 
draw_healthbar(x1,y1,x2,y2,healthPercent,c_black,c_maroon,c_red,0,true,true)