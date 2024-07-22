ENTITY p3 IS
  PORT(clk,r,x: IN bit; z : INOUT bit);
END p3;

ARCHITECTURE estructural OF p3 IS

 COMPONENT inv IS
  PORT(e : IN bit; s : OUT bit);
END COMPONENT;

  COMPONENT and2 
  PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;

  COMPONENT and3
  PORT(e1, e2,e3 : IN bit; s : OUT bit);
  END COMPONENT;


  COMPONENT or2
  PORT(e1, e2 : IN bit; s : OUT bit);
END COMPONENT;

   
  COMPONENT ffd IS
   PORT(clk, d, r : IN bit; q,  qn: OUT bit );
END COMPONENT;

SIGNAL xn, d1, d2, q1p, q0p, q1, q0, q1n, q0n :bit;

BEGIN
  inv1    :inv  PORT MAP(x,xn);  
  and21   :and2 PORT MAP(q0,x, d1);   
  and31   :and3 PORT MAP(q0n, xn,q1,d2);
  or21    :or2  PORT MAP(d1,d2, q1p);  
  ffd21   :ffd  PORT MAP(clk,q1p,r,q1,q1n );  
  ffd22   :ffd  PORT MAP(clk,q0p,r,q0,q0n); 
  q0p <= xn;
  and22   :and2 PORT MAP(q1,q0,z);  
  
END estructural;