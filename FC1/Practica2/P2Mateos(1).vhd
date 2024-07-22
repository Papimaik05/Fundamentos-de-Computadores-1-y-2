ENTITY p2_1 IS
  PORT(a,b,ce : IN bit; s,cs : INOUT bit);
END p2_1;

ARCHITECTURE estructural OF p2_1 IS

 

  COMPONENT and2 
  PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;

  COMPONENT or3
  PORT(e1, e2, e3 : IN bit; s : OUT bit);

   
  END COMPONENT;

  COMPONENT xor2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT ;

SIGNAL d1,d2,d3,p :bit;

BEGIN
   
 
  and21   :and2 PORT MAP(a, ce, d1);   
  and22   :and2 PORT MAP(a, b,d2);
  and23   :and2 PORT MAP(b, ce,d3 );
  xor21   :xor2 PORT MAP(a,b,p);
  xor22   :xor2 PORT MAP(p,ce,s);
  or31    :or3  PORT MAP(d1, d2, d3,cs);
  
  
 
  
END estructural;