ENTITY p1 IS
  PORT(x3,x2, x1, x0 : IN bit; z : INOUT bit);
END p1;

ARCHITECTURE estructural OF p1 IS

  COMPONENT or2 
  PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;

  COMPONENT and3 
  PORT(e1, e2, e3 : IN bit; s : OUT bit);
  END COMPONENT;

  COMPONENT or3
  PORT(e1, e2, e3 : IN bit; s : OUT bit);

   
  END COMPONENT;

  COMPONENT inv 
  PORT(e : IN bit; s : OUT bit);
  END COMPONENT;

SIGNAL n1,n2,n3,z1,z2,z3,z4,c1 :bit;

BEGIN
   
  inv1  :inv PORT MAP(x3, n3);
  inv2  :inv PORT MAP(x2, n2);
  inv3  :inv PORT MAP(x1, n1);
  and31   :and3 PORT MAP(n3, n2, x1,z1);   
  and32   :and3 PORT MAP(n2, x1,x0,z2);
  and33   :and3 PORT MAP(n3, x2,x0,z3 );
  and34   :and3 PORT MAP(x2, n1, x0,z4);
  or31    :or3  PORT MAP(z1, z2, z3,c1);
  or21    :or2  PORT MAP(c1,z4,z);
  
 
  
END estructural;