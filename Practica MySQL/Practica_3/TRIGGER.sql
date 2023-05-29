DELIMITER //
create trigger actualizar_producto before update on productos
for each row 
 begin
 if new.precioCompra<>old.precioCompra
 then 
      set New.precioCompra=old.precioCompra*0.5;
end if;
end