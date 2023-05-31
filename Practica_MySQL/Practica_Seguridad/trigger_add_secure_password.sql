DELIMITER //
create trigger add_secure_password before insert on usuario
for each row 
begin
	set NEW.password = md5(NEW.password);
end
