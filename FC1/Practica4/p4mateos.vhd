ENTITY p4 IS
  PORT(clk,nclear,x: IN bit; z : INOUT bit);
END p4;

ARCHITECTURE estructural OF p4 IS

 COMPONENT inv IS
  PORT(e : IN bit; s : OUT bit);
END COMPONENT;

  COMPONENT and2 
  PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;

  COMPONENT and3
  PORT(e1, e2,e3 : IN bit; s : OUT bit);
  END COMPONENT;


  COMPONENT or3
  PORT(e1, e2 ,e3 : IN bit; s : OUT bit);
END COMPONENT;
  
  COMPONENT xor2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END COMPONENT;

   
  COMPONENT ffd IS
   PORT(clk, d, r : IN bit; q,  qn: OUT bit );
END COMPONENT;

SIGNAL xn, d1, d2,d3,p1, q1p, q0p, q1, q0, q1n, q0n :bit;

BEGIN

  ffd21   :ffd  PORT MAP(clk,q1p,nclear,q1,q1n );  
  ffd22   :ffd  PORT MAP(clk,q0p,nclear,q0,q0n);
  xor21 :xor2 PORT MAP(q0,q1,p1);
  q0p <= q0n;
  q1p <= p1;
  inv1    :inv  PORT MAP(x,xn);  
  and21   :and2 PORT MAP(q0n,q1, d1);
  and22   :and2 PORT MAP(q0n,x, d2);      
  and31   :and3 PORT MAP(q1n, xn,q0,d3);
  or31    :or3  PORT MAP(d1,d2,d3 ,z);  
END estructural;
