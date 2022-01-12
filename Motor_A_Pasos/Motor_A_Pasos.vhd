library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Motor_A_Pasos is
	port (clk : in std_logic;
			sec : in std_logic_vector(1 downto 0);
			q: out std_logic_vector (3 downto 0));
			
end Motor_A_Pasos;

architecture Motor_A_Pasos_arq of Motor_A_Pasos is
type estados is(D1,D2,D3,D4,D5,D6,D7,D8);
signal edo_act: estados;
signal edo_fut: estados;
begin
	process(edo_act,sec) begin
		case edo_act is
			when D1=> q<="0001";
				if		sec="00" then edo_fut<=d1;
				elsif	sec="01" then edo_fut<=d3;
				elsif	sec="10" then edo_fut<=d2;
				else	edo_fut<=d2;
				end if;
			when D2=> q<="0011";
				if		sec="00" then edo_fut<=d2;
				elsif	sec="01" then edo_fut<=d3;
				elsif	sec="10" then edo_fut<=d4;
				else	edo_fut<=d3;
				end if;	
			when D3=> q<="0010";
				if		sec="00" then edo_fut<=d3;
				elsif	sec="01" then edo_fut<=d5;
				elsif	sec="10" then edo_fut<=d4;
				else	edo_fut<=d4;
				end if;
			when D4=> q<="0110";
				if		sec="00" then edo_fut<=d4;
				elsif	sec="01" then edo_fut<=d5;
				elsif	sec="10" then edo_fut<=d6;
				else	edo_fut<=d5;
				end if;
			when D5=> q<="0100";
				if		sec="00" then edo_fut<=d5;
				elsif	sec="01" then edo_fut<=d7;
				elsif	sec="10" then edo_fut<=d6;
				else	edo_fut<=d6;
				end if;				
			when D6=> q<="1100";
				if		sec="00" then edo_fut<=d6;
				elsif	sec="01" then edo_fut<=d7;
				elsif	sec="10" then edo_fut<=d8;
				else	edo_fut<=d7;
				end if;
			when D7=> q<="1000";
				if		sec="00" then edo_fut<=d7;
				elsif	sec="01" then edo_fut<=d1;
				elsif	sec="10" then edo_fut<=d8;
				else	edo_fut<=d8;
				end if;
			when D8=> q<="1001";
				if		sec="00" then edo_fut<=d8;
				elsif	sec="01" then edo_fut<=d1;
				elsif	sec="10" then edo_fut<=d2;
				else	edo_fut<=d1;
				end if;
		end case;
		end process;
		process (clk) begin
			if rising_edge (clk) then
				edo_act<=edo_fut;
			end if;
		end process;
end Motor_A_Pasos_arq;

