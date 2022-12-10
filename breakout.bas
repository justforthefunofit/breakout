100 rem -------------------------------
110 rem initialization of variables
120 rem -------------------------------
130 pp=17: rem paddle start line on screen
140 sm=1024: rem screen memory start
150 sa=sm+(22*40): rem screen boundary adress range
160 dx=1:dy=1: rem initial direction of bouncing ball (positive)
170 x=int(rnd(1)*24):y=12: rem ball start position with random x position
180 c$=chr$(28)+chr$(149)+chr$(158)+chr$(30)+chr$(31) : rem define color values
185 1 = 1 : rem used to reverse ball on missed and last key direction
188 h = 0 : rem hit score variable
190 rem -------------------------------
200 rem initialisation of screen start and color
210 rem -------------------------------
220 poke 650,128 : rem set key input on repeative
230 poke 53280,0 : rem screen border color to black
240 poke 53281,0 : rem screen color to black
250 print chr$(147): rem clear screen and cursor to top
260 rem --------------------------------
270 rem draw five color lines with eight bars
280 rem --------------------------------
290 print : rem print blanco screen line on top
300 for p=1 to 5:
310 for n=1 to 8
320 print chr$(18)+mid$(c$,p,1)+chr$(229)+"   "+chr$(234);
330 next n
340 next p
350 rem --------------------------------
360 rem start main loop (paddle and bouncing ball)
370 rem --------------------------------
380 sp=sa+pp : rem calculate start position of paddle
390 rem --------------------------------
400 rem poke the paddle characters into memory on calculated position
410 rem start and end with space (32) to clear previous on movement
420 rem --------------------------------
430 pokesp,32:pokesp+1,98:pokesp+2,98:pokesp+3,98:pokesp+4,98:pokesp+5,32
440 rem --------------------------------
450 rem get input (key "1" = left, key "2" = right
460 rem --------------------------------
470 getk:pp=pp+(k=1)-(k=2)
480 rem --------------------------------
490 rem validate boundaries' to ensure new position is within play area
500 rem --------------------------------
510 if pp<-1 then pp=-1 : rem reset pebble position to min -1
520 if pp>35 then pp=35 : rem reset pebble position to max 35
530 rem --------------------------------
540 rem clear current bouncing ball position and calculate new
550 rem --------------------------------
560 pokesm+x+(y*40),32:
570 if y>=24 or y<1 then dy=-dy : rem reverse y on boundary
580 if y>=24 then ms=ms+1 : rem count missed if y below pebble
590 if x>=39 or x<1 then dx=-dx : rem reverse x on boundary
600 if k=1 then mc=-mc : rem direction correction on hit and last key
610 x= x+dx : y= y+dy : rem new ball x,y coordinate
620 rem --------------------------------
630 rem validate hit pebble on hit count and shift to pebble position
640 rem --------------------------------
650 if peek(sm+x+(y*40))=98 then dx=-dx*mc:dy=-dy:h=h+1:x=pp
660 poke sm+x+(y*40),81 : rem poke new ball position on screen
670 print chr$(19)"hit:";h;" missed:";ms : rem rewrite score on screen
680 goto 380 : rem restart main loop
