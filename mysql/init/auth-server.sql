-- Dumping data for table auth_server.oauth_client_details: 1 rows
DELETE FROM `oauth_client_details`;
INSERT INTO `oauth_client_details` (`client_id`, `access_token_validity`, `additional_information`, `authorized_grant_type`, `refresh_token_validity`, `resource_ids`, `scope`, `web_server_redirect_uri`, `client_secret`) VALUES
	('id_ecs', '3600', '{}', 'authorization_code,password,refresh_token,implicit', '1000', 'inventory,payment', 'READ,WRITE', 'http://localhost:8080/code', '{bcript}$2a$10$R2CJxeJEGvGl1idWo3R4N.mWqLzDEXxjFRdUnvq9RoIEleAxDPk0q');


-- Dumping data for table auth_server.permission: 4 rows
DELETE FROM `permission`;
INSERT INTO `permission` (`name`) VALUES
	('create_profile'),
	('read_profile'),
	('update_profile'),
	('delete_profile');

-- Dumping data for table auth_server.role: 2 rows
DELETE FROM `role`;
INSERT INTO `role` (`name`) VALUES
	('ROLE_admin'),
	('ROLE_operador');

-- Dumping data for table auth_server.permission_role: 6 rows
DELETE FROM `permission_role`;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(2, 2),
	(3, 2);

-- Dumping data for table auth_server.user_data: 1 rows
DELETE FROM `user_data`;
INSERT INTO `user_data` (`account_non_expired`, `account_non_locked`, `credentials_non_expired`, `email`, `enabled`, `user_name`, `password`) VALUES
	(b'10000000', b'10000000', b'10000000', 'tester@g.c', b'10000000', 'tester', '{bcript}$2a$10$zOR8J1nnnA7nM5igLl8Ste2PLcWp4llnEgWfrj9UdeEnMTTMvaS8C');

-- Dumping data for table auth_server.user_role: 1 rows
DELETE FROM `user_role`;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1);
