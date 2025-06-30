%RS码编码
functioncode=rs_rscode(msg)
g=[1003213
0105514
0017616];
g=gf(g,3);
code=msg*g;