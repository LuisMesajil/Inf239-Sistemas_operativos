with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


procedure fumadores is

	task agente is
		entry agenteSem;
	end;
	task tiene_tabaco is
		entry tabacoSem;
	end;
	task tiene_cerillos is
		entry cerillosSem;
	end;
	task tiene_papel is
		entry papelSem;
	end;

	
	task body agente is
	
		subtype Procesos is Integer range 1 .. 3;
		package Random_Proc is new Ada.Numerics.Discrete_Random (Procesos);
		use Random_Proc;
		
		G: Generator;
		D: Procesos;
		
		
		hayPapel, hayCerillos, hayTabaco : Boolean := False;
		
		protected colocaEnMesa is 
			procedure Tabaco;
			procedure Cerillos;
			procedure Papel;
			
		end;
		
		protected body colocaEnMesa is
			procedure Tabaco is
			begin
				put_line ("Colocando ---> Tabaco");
				if hayPapel then
					hayPapel := false;
					tiene_cerillos.cerillosSem;
				elsif hayCerillos then
					hayCerillos := false;
					tiene_papel.papelSem;
				else
					hayTabaco := true;
				end if;
					
			end Tabaco;
		
		
			procedure Cerillos is
			begin
				put_line ("Colocando ---> Cerillos");
				if hayPapel then
					hayPapel := false;
					tiene_tabaco.tabacoSem;
				elsif hayTabaco then
					hayTabaco := false;
					tiene_papel.papelSem;
				else
					hayCerillos := true;
				end if;
					
			end Cerillos;

			
			
			procedure Papel is
			begin
				put_line ("Colocando ---> Papel");
				if hayCerillos then
					hayCerillos := false;
					tiene_tabaco.tabacoSem;
				elsif hayTabaco then
					hayTabaco := false;
					tiene_cerillos.cerillosSem;
				else
					hayPapel := true;
				end if;
					
			end Papel;
		end colocaEnMesa;
	
	
	begin
		Reset(G);
		
		for k in integer range 1 .. 5 loop
			D := Random (G);
			accept agenteSem do null;end;
			
			case D is
				when 1		=> 	colocaEnMesa.Cerillos;
								colocaEnMesa.Papel;
				when 2		=> 	colocaEnMesa.Cerillos;
								colocaEnMesa.Tabaco;
				when 3		=> 	colocaEnMesa.Tabaco;
								colocaEnMesa.Papel;
			end case;
		end loop;
		
	end agente;
	
	
	task body tiene_tabaco is
	begin
		for k in integer range 1 .. 10 loop
			accept tabacoSem do null;end;
			put_line ("           Tengo Tabaco => Armando Ciguarro");
			agente.agenteSem ;
			put_line ("Uff buen cigarro: Tenia tabaco");
			put_line ("");
		end loop;
	end tiene_tabaco;
			
	
	task body tiene_Cerillos is
	begin
		for k in integer range 1 .. 10 loop
			accept cerillosSem do null;end;
			put_line ("           Tengo Cerillos => Armando Ciguarro");
			agente.agenteSem ;
			put_line ("Uff buen cigarro: Tenia Cerillos");
			put_line ("");
		end loop;
	end tiene_Cerillos;
	
	
	task body tiene_papel is
	begin
		for k in integer range 1 .. 10 loop
			accept papelSem do null;end;
			put_line ("           Tengo Papel => Armando Ciguarro");
			agente.agenteSem ;
			put_line ("Uff buen cigarro: Tenia Papel");
			put_line ("");
		end loop;
	end tiene_papel;
	
begin
	agente.agenteSem;
end fumadores;




















