package rationals is 

  -- A rational number is defined by the pair (numerator, denominator) where 
  -- both are std_logic_vector(15 downto 0).
  constant numer : integer := 0; -- numerator
  constant denom : integer := 1; -- denominator
  type rational is array (natural range numer to denom) of std_logic_vector(15 downto 0);
  
  function to_rational (a, b : std_logic_vector(15 downto 0)) return rational;
  
  function numerator (a : rational) return std_logic_vector(15 downto 0);
  function denominator (a : rational) return std_logic_vector(15 downto 0);
  function "+" (a, b : rational) return rational;
  function "-" (a, b : rational) return rational;
  function "*" (a, b : rational) return rational;
  function "/" (a, b : rational) return rational;
  
  function gcd (a, b : std_logic_vector(15 downto 0))  return rational;
	--output of gcd is a rational whose numerator is the gcd
	-- and denominator is the count (helpful for division)
  function Dadda (a, b : rational)  return rational;
  function "Dadda" (a, b, c, d : rational) return rational;

end rationals;


package body rationals is

  function to_rational (a, b : std_logic_vector(15 downto 0)) return rational is
    variable r : rational;
    variable c : std_logic_vector(15 downto 0);
  begin
    d1 : DFF port map(a,c);
    r(numer) := c;
    r(denom) := b;
    return r;
  end to_rational;
  
  function numerator (a : rational) return std_logic_vector(15 downto 0) is
    variable n : std_logic_vector(15 downto 0);
  begin
    n := a(numer);
    return n;
  end numerator;

  function denominator (a : rational) return std_logic_vector(15 downto 0) is
    variable d : std_logic_vector(15 downto 0);
  begin
    d := a(denom);
    return d;
  end denominator;

  function "+" (a, b : rational) return rational is
    variable r : rational;
    variable tn, td : std_logic_vector(15 downto 0);
  begin
    tn := a(numer)*b(denom) + a(denom)*b(numer);
    td := a(denom) * b(denom);
    if ( gcd(abs(tn), abs(td)) > 0 ) then
      r(numer) := tn / gcd(abs(tn), abs(td));
      r(denom) := td / gcd(abs(tn), abs(td));
    else
      r(numer) := tn;
      r(denom) := td;
    end if;
    return r;
  end "+";

  function "-" (a, b : rational) return rational is
    variable r : rational;
    variable tn, td : std_logic_vector(15 downto 0);
  begin
    tn := a(numer)*b(denom) - a(denom)*b(numer);
    td := a(denom) * b(denom);
    if ( gcd(abs(tn), abs(td)) > 0 ) then
      r(numer) := tn / gcd(abs(tn), abs(td));
      r(denom) := td / gcd(abs(tn), abs(td));
    else
      r(numer) := tn;
      r(denom) := td;
    end if;
    return r;
  end "-";
    
  function "*" (a, b : rational) return rational is
    variable r : rational;
    variable tn, td : std_logic_vector(15 downto 0);
  begin
    tn := a(numer) * b(numer);
    td := a(denom) * b(denom);
    if ( gcd(abs(tn), abs(td)) > 0 ) then
      r(numer) := tn / gcd(abs(tn), abs(td));
      r(denom) := td / gcd(abs(tn), abs(td));
    else
      r(numer) := tn;
      r(denom) := td;
    end if;
    return r;
  end "*";

  function "/" (a, b : rational) return rational is
    variable r : rational;
    variable tn, td : std_logic_vector(15 downto 0);
  begin
    tn := a(numer) * b(denom);
    td := a(denom) * b(numer);
    if ( gcd(abs(tn), abs(td)) > 0 ) then
      r(numer) := tn / gcd(abs(tn), abs(td));
      r(denom) := td / gcd(abs(tn), abs(td));
    else
      r(numer) := tn;
      r(denom) := td;
    end if;
    return r;
  end "/";


  function gcd (a, b : std_logic_vector(15 downto 0)) return std_logic_vector(15 downto 0) is
  begin
    if a = 0 then
      return b;
    end if;
    if b = 0 then
      return a;
    end if;
    if (a > b) then
      return gcd(b, a mod b);
    else
      return gcd(a, b mod a);
    end if;
  end gcd;
   
  function gcditer (a, b : std_logic_vector(15 downto 0)) return std_logic_vector(15 downto 0) is
    variable x, y : std_logic_vector(15 downto 0);
		variable count : std_logic_vector(15 downto 0) := "0000000000000001";
  begin
    x := a;
    y := b;
    if ((x = 0) and (y = 0)) then
      return 0;
    end if;
    while (x /= y) loop
      if (x >= y) then
        x := x - y;
      else
        y := y - x;
      end if;
			count := count +"0000000000000001";
    end loop;
    return count;
		--gcd = x
  end gcditer;

end rationals;
