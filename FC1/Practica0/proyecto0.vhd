ENTITY grey IS
  PORT(x2, x1, x0 : IN bit; z2, z1, z0 : INOUT bit);
END grey;

ARCHITECTURE estructural OF grey IS


  COMPONENT xor2
    PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;

BEGIN

  xor21  : xor2   PORT MAP(x2, x1, z1);
  xor22  : xor2   PORT MAP(z1, x0, z0);
  z2 <= x2;
END estructural;

