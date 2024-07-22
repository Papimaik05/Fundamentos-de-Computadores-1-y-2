-----------------------------------------------------------------
--        BIBLIOTECA DE COMPONENTES DEL LABORATORIO DE FC I
-----------------------------------------------------------------

-----------------
--- Inversor
-----------------
ENTITY inv IS
  PORT(e : IN bit; s : OUT bit);
END inv;
ARCHITECTURE comportamiento OF inv IS
BEGIN
  s <= NOT e;
END comportamiento;


-----------------------------
--- Puerta AND de 2 entradas
-----------------------------
ENTITY and2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END and2;
ARCHITECTURE comportamiento OF and2 IS

BEGIN
  s <= e1 AND e2;
END comportamiento;


---------------------------
--- Puerta OR de 2 entradas
---------------------------
ENTITY or2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END or2;
ARCHITECTURE comportamiento OF or2 IS

BEGIN
  s <= e1 OR e2;
END comportamiento;


------------------------------
--- Puerta AND de 3 entradas
------------------------------
ENTITY and3 IS
  PORT(e1, e2, e3 : IN bit; s : OUT bit);
END and3;

ARCHITECTURE comportamiento OF and3 IS
BEGIN
  s <= e1 AND e2 AND e3;
END comportamiento;


-----------------------------
--- Puerta OR de 3 entradas
-----------------------------
ENTITY or3 IS
  PORT(e1, e2, e3 : IN bit; s : OUT bit);
END or3;

ARCHITECTURE comportamiento OF or3 IS
BEGIN
  s <= e1 OR e2 OR e3;
END comportamiento;


------------------------------
--- Puerta XOR de 2 entradas
------------------------------
ENTITY xor2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END xor2;
ARCHITECTURE comportamiento OF xor2 IS
BEGIN
  s <= e1 XOR e2;
END comportamiento;


--------------------------
--- Multiplesor de 4 a 1
--------------------------
ENTITY mux4a1 IS
    PORT (sel1, sel0, x3, x2, x1, x0 : IN bit; z : OUT bit);
end ENTITY;

ARCHITECTURE comportamiento OF mux4a1 IS
BEGIN
    z <= x0 WHEN sel1 = '0' AND sel0 = '0' ELSE
         x1 WHEN sel1 = '0' AND sel0 = '1' ELSE
         x2 WHEN sel1 = '1' AND sel0 = '0' ELSE
         x3;
END comportamiento;


---------------------------------------
--- Biestable D con clear negativo
---------------------------------------
ENTITY ffd IS
   PORT(clk, d, r : IN bit; q,  qn: OUT bit );
END ffd;

ARCHITECTURE comportamiento OF ffd IS
BEGIN
   PROCESS(clk,r)
      BEGIN
	IF (r='0') THEN
		q <= '0';
		qn<='1';
	ELSIF (rising_edge (clk)) THEN
		q <= d;
		qn <= not d;
	END IF;
   END PROCESS;
END comportamiento;
