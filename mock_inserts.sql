INSERT INTO Users(`username`) VALUES ("swetharevanur");
INSERT INTO Users(`username`) VALUES ("rennerlucena");
INSERT INTO Users(`username`) VALUES ("nickmachado");

INSERT INTO PromotionTypes(`promotion_type`, `promotion_code`) VALUES ("free", 0);

INSERT INTO RequestTypes(`request_type`, `request_code`) VALUES ("going", 0);
INSERT INTO RequestTypes(`request_type`, `request_code`) VALUES ("no food", 1);

INSERT INTO Promotions(`promotion_id`, `title`, `start_time`, `end_time`, `location`, `promotion_code`, `no_food`, `est_id`)
VALUE ("BdyGkn9w", "Google PhD Talk", "2017-11-06 15:30:00", "2017-11-06 16:30:00", "Gates 104", 0, FALSE, NULL);
INSERT INTO Promotions(`promotion_id`, `title`, `start_time`, `end_time`, `location`, `promotion_code`, `no_food`, `est_id`)
VALUE ("gGz53Lzp", "Teradata Info Session", "2017-11-06 17:00:00", "2017-11-06 18:00:00", "Gates 104", 0, FALSE, NULL);
INSERT INTO Promotions(`promotion_id`, `title`, `start_time`, `end_time`, `location`, `promotion_code`, `no_food`, `est_id`)
VALUE ("cz7N8KXz", "Apple PhD Talk & Networking Event", "2017-11-07 14:00:00", "2017-11-07 16:00:00", "Gates 219", 0, FALSE, NULL);

INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("swetharevanur", "gGz53Lzp", 0);
INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("swetharevanur", "gGz53Lzp", 1);
INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("rennerlucena", "BdyGkn9w", 0);
INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("nickmachado", "gGz53Lzp", 0);
INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("rennerlucena", "BdyGkn9w", 1);
INSERT INTO Requests(`username`, `promotion_id`, `request_code`) 
VALUES ("nickmachado", "gGz53Lzp", 1);

