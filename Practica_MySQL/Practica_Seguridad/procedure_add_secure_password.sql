CREATE DEFINER=`root`@`localhost` 
PROCEDURE `add_secure_password`()
BEGIN
	update usuario set password = md5(password);
END