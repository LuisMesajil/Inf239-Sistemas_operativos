

with Ada.Text_IO;
use Ada.Text_IO;



procedure Principal is

	task comprar_carne;
	task comprar_ensalada;
	task comprar_vino;
	
	-- comprar_carne
	task body comprar_carne is
		
	begin
		Put_Line ("comprar_carne");
	end comprar_carne;
	
	-- comprar_ensalada
	task body comprar_ensalada is
		
	begin
		Put_Line ("comprar_ensalada");
	end comprar_ensalada;
	-- comprar_vino
	task body comprar_vino is
		
	begin
		Put_Line ("comprar_vino");
	end comprar_vino;
	
	
	-- Cuerpo Tarea Principal
	
	begin
		return ;
	end Principal;
