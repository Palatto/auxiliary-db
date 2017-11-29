DROP TRIGGER IF EXISTS after_requests_insert;
DROP TRIGGER IF EXISTS after_nofoodcount_update;

DELIMITER $$
CREATE TRIGGER after_requests_insert
AFTER INSERT ON `Requests`
FOR EACH ROW BEGIN
	IF (NEW.request_code = `0`) THEN
		IF EXISTS (SELECT * FROM GoingCount WHERE promotion_id = NEW.promotion_id) THEN
			UPDATE GoingCount SET going_count = going_count + 1 WHERE promotion_id = NEW.promotion_id;
        ELSE 
			INSERT INTO GoingCount (promotion_id, going_count) VALUES (NEW.promotion_id, `1`);
		END IF;
    ELSE 
		IF (NEW.request_code = `1`) THEN
			IF EXISTS (SELECT * FROM NoFoodCount WHERE promotion_id = NEW.promotion_id) THEN
				UPDATE NoFoodCount SET no_food_count = no_food_count + 1 WHERE promotion_id = NEW.promotion_id;
			ELSE
				INSERT INTO NoFoodCount (promotion_id, going_count) VALUES (NEW.promotion_id, `1`);
			END IF;
		END IF;
    END IF;
END$$

create function InlineMax(@val1 int, @val2 int) returns int as
begin
  if @val1 > @val2
    return @val1
  return @val2
end

DELIMITER $$
CREATE TRIGGER after_nofoodcount_update
AFTER UPDATE ON `NoFoodCount`
FOR EACH ROW BEGIN
	IF (NEW.nofoodcount > InlineMax(5, (1/10)*(SELECT going_count FROM GoingCount WHERE promotion_id = NEW.promotion_id))) THEN
		DELETE FROM GoingCount WHERE promotion_id = NEW.promotion_id;
		DELETE FROM NoFoodCount WHERE promotion_id = NEW.promotion_id;        
        DELETE FROM Promotions WHERE promotion_id = NEW.promotion_id;
        DELETE FROM Requests WHERE promotion_id = NEW.promotion_id;
	END IF;
END$$