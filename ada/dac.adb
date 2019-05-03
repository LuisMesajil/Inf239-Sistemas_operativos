
with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;


procedure dac is
	
	cont : Integer := 0;

	task tarea1;
	task tarea2 is
		entry uno_dos;
	end tarea2;
	
	task tarea3 is
		entry uno_tres;
	end tarea3;
	
	task tarea4 is
		entry dos_cuatro;
	end tarea4;
	
	task tarea5 is
		entry dos_cinco;
		entry tres_cinco;
	end tarea5;

	-- Tarea1
	task body tarea1 is 
		k : Integer := 0;
	begin
		for k in integer range 1 .. 10 loop
			put_line ("Tarea1");
		end loop;
		tarea2.uno_dos;
		tarea3.uno_tres;
	end tarea1;
	
	-- Tarea2
	task body tarea2 is 
		k : Integer := 0;
	begin
		accept uno_dos do
			null;
		end;
		for k in integer range 1 .. 10 loop
			put_line ("Tarea2");
		end loop;
		
		tarea4.dos_cuatro;
		tarea5.dos_cinco;
	end tarea2;
	
	-- Tarea3
	task body tarea3 is 
		k : Integer := 0;
	begin
		accept uno_tres do
			null;
		end;
		for k in integer range 1 .. 10 loop
			put_line ("Tarea3");
		end loop;
		tarea5.tres_cinco;
	end tarea3;
	
	-- Tarea4
	task body tarea4 is 
		k : Integer := 0;
	begin
		accept dos_cuatro do
			null;
		end;
		for k in integer range 1 .. 10 loop
			put_line ("Tarea4");
		end loop;
	end tarea4;
	-- Tarea5
	task body tarea5 is 
		k : Integer := 0;
	begin
		accept dos_cinco do
			null;
		end;
		accept tres_cinco do
			null;
		end;
		for k in integer range 1 .. 10 loop
			put_line ("Tarea5");
		end loop;
	end tarea5;
	-- Principal
	begin
		null;
	end dac;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
