library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity TLC is
	port(lrb: in std_logic_vector(2 downto 0);
		  clk: in std_logic;
		  lights: out std_logic_vector(7 downto 0));
end TLC;

architecture char of TLC is
signal count: std_logic_vector(4 downto 0);
constant initial: std_logic_vector(4 downto 0) := "00000";
constant count32: std_logic_vector(4 downto 0) := "11110";

begin 
	process(clk, lrb, count)
		begin
			if rising_edge(clk) then
				if lrb = "000" then
					lights <= "00000000";
				elsif lrb = "001" then
					lights <= "11111111";
				elsif lrb = "010" then
						count <= "00000";
						if count <= "00110" then
							lights <= "00000000";
							count <= count + 1;
						elsif (count <= "01100" and count > "00110") then
							lights <= "00001000";
							count <= count + 1;
						elsif (count <= "10010" and count > "01100") then
							lights <= "00001100"; 
							count <= count + 1;
						elsif (count <= "11000" and count > "10010") then
							lights <= "00001110";
							count <= count + 1;
						elsif (count <= count32 and count > "11000") then
							lights <= "00001111";
							count <= count + 1;
						end if;
				elsif lrb = "011" then 
								count <= "00000";
						if count <= "00110" then
							lights <= "11110000";
							count <= count + 1;
						elsif (count <= "01100" and count > "00110") then
							lights <= "11111000";
							count <= count + 1;
						elsif (count <= "10010" and count > "01100") then
							lights <= "11111100"; 
							count <= count + 1;
						elsif (count <= "11000" and count > "10010") then
							lights <= "11111110";
							count <= count + 1;
						elsif (count <= count32 and count > "11000") then
							lights <= "11111111";
							count <= count + 1;
						end if;
				elsif lrb = "100" then
								count <= "00000";
						if count <= "00110" then
							lights <= "00000000";
							count <= count + 1;
						elsif (count <= "01100" and count > "00110") then
							lights <= "00010000";
							count <= count + 1;
						elsif (count <= "10010" and count > "01100") then
							lights <= "00110000"; 
							count <= count + 1;
						elsif (count <= "11000" and count > "10010") then
							lights <= "01110000";
							count <= count + 1;
						elsif (count <= count32 and count > "11000") then
							lights <= "11110000";
							count <= count + 1;
						end if;
				elsif lrb = "101" then
						count <= "00000";
						if count <= "00110" then
							lights <= "00000000";
							count <= count + 1;
						elsif (count <= "01100" and count > "00110") then
							lights <= "00011111";
							count <= count + 1;
						elsif (count <= "10010" and count > "01100") then
							lights <= "00111111"; 
							count <= count + 1;
						elsif (count <= "11000" and count > "10010") then
							lights <= "01111111";
							count <= count + 1;
						elsif (count <= count32 and count > "11000") then
							lights <= "11111111";
							count <= count + 1;
						end if;
				elsif lrb = "110" then
						count <= "00000";
						if (count <= "10000") then 
							lights <= "00000000";
							count <= count + 1;
						elsif (count <= "11111" and count > "10000") then
							lights <= "11111111";
							count <= count + 1;
						end if;
				elsif lrb = "111" then 
						lights <= "11111111";			
				end if;
			end if;
		end process;
end char;

				
					
						
					
					