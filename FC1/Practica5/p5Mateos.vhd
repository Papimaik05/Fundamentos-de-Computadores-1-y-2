ENTITY p5 IS
  PORT(clk,r,e0,e1,e2,esi,c0,c1: IN bit; q2,q1,q0 : INOUT bit);
END p5;

ARCHITECTURE estructural OF p5 IS

   COMPONENT mux4a1 IS
    PORT (sel1, sel0, x3, x2, x1, x0 : IN bit; z : OUT bit);
end COMPONENT;
  COMPONENT ffd IS
   PORT(clk, d, r : IN bit; q,  qn: OUT bit );
END COMPONENT;

SIGNAL p3,p2,p1,q2p,q1p,q0p :bit;

BEGIN
  mux4a1_1 :mux4a1  PORT MAP(c1,c0,q2,q1,q0,e2,p3);
  mux4a1_2 :mux4a1  PORT MAP(c1,c0,q1,q0,q2,e1,p2);
  mux4a1_3 :mux4a1  PORT MAP(c1,c0,q0,esi,q1,e0,p1);
  q2p <= p3;
  q1p <= p2;
  q0p <= p1;
  ffd21   :ffd  PORT MAP(clk,q2p,r,q2,open );  
  ffd22   :ffd  PORT MAP(clk,q1p,r,q1,open);
  ffd23   :ffd  PORT MAP(clk,q0p,r,q0,open);
END estructural;

