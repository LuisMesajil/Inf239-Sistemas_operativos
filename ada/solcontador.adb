
with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;


procedure contador is

	no_termina1, no_termina2 : Boolean := True;
	
	-- ##### Objeto protegido contador #####
	protected contador is 
		function lee return Integer;
		procedure incrementa;
	private 
		cont :Integer:=0;
	end contador;
	
	protected body contador is
		procedure incrementa is
		begin
			cont := cont + 1;
		end incrementa;
		
		function lee return Integer is
		begin
			return cont;
		end lee;
	end contador;
	
	-- #####################################
	
	task Tarea1 is
	end Tarea1;
	task Tarea2 is
	end Tarea2;
	
	-- Tarea 1
	task body Tarea1 is
		k : Integer := 0;
	begin
		while k < 1_000_000 loop
			contador.incrementa;
			k := k + 1;
		end loop;
		no_termina1 := false;
	end Tarea1;
	
	
	-- Tarea 2
	task body Tarea2 is
		k : Integer := 0;
	begin
		while k < 1_000_000 loop
			contador.incrementa;
			k := k + 1;
		end loop;
		no_termina2 := false;
	end Tarea2;
	
	-- Cuerpo Tarea Principal
	
	begin
		while no_termina1 or no_termina2 loop
			null;
		end loop;
		
		put_line ("La suma es: ");
		put (contador.lee);
	end contador;
