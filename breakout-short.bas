1 ?chr$(147):pO53280,0:pO53281,0:pp=17:pO650,128:sa=1024+(22*40):sm=1024:dx=1
2 x=int(rnd(1)*24):y=12:dy=1:c$=chr$(28)+chr$(149)+chr$(158)+chr$(30)+chr$(31)
3?:fOp=1to5:fOrn=1to8:?chr$(18)+mid$(c$,p,1)+chr$(229)+"   "+chr$(234);:nE:nE
4 sp=sa+pp:pOsp,32:pOsp+1,98:pOsp+2,98:pOsp+3,98:pOsp+4,98:pOsp+5,32
5 getk:pp=pp+(k=1)-(k=2):ifpp<-1thenpp=-1
6 ifpp>35thenpp=35
7 pokesm+x+(y*40),32:ify>=24ory<1thendy=-dy:ify>=24then ms=ms+1
8 ifx>=39orx<1thendx=-dx  
9 mc=-1:ifk=1tHmc=-mc
10 x=x+dx:y=y+dy:ifpE(sm+x+(y*40))=98tHdx=-dx*mc:dy=-dy:l=l+1:x=pp
11 poke sm+x+(y*40),81:print chr$(19)"hit:";l;" missed:";ms:goto4
