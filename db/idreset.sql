ALTER TABLE timetable AUTO_INCREMENT = 1;
SET @COUNT=0;
UPDATE timetable SET id = @COUNT:=@COUNT+1;