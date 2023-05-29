DELIMITER //
create trigger variacion_costo before update on productos
for each row 
begin
	insert into historico_precio(id, descripcion, preciovariable)
    values (new.id, new.descripcion, new.precioVenta);
end