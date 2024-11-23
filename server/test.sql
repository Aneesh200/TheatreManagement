USE theatre_management2;

-- Insert sample movies
INSERT INTO Movie (Movie_ID, Name, Duration, Genre) VALUES
('mov1', 'Oppenheimer', 180, 'Drama/Historical'),
('mov2', 'Interstellar', 169, 'Sci-Fi'),
('mov3', 'The Dark Knight', 152, 'Action'),
('mov4', 'Inception', 148, 'Sci-Fi/Action'),
('mov5', 'Barbie', 114, 'Comedy/Fantasy');

-- Insert screens
INSERT INTO Screen (Screen_ID, Screen_No, Type) VALUES
('scr1', 1, 'IMAX'),
('scr2', 2, 'Dolby Atmos'),
('scr3', 3, 'Regular'),
('scr4', 4, '3D');

-- Insert shows for next 7 days
INSERT INTO `Show` (ShowID, Movie_ID, Screen_ID, Date, Start_Time) 
VALUES
-- Today's shows
('sh1', 'mov1', 'scr1', CURDATE(), '10:00:00'),
('sh2', 'mov2', 'scr2', CURDATE(), '11:30:00'),
('sh3', 'mov3', 'scr3', CURDATE(), '14:00:00'),
('sh4', 'mov4', 'scr4', CURDATE(), '16:30:00'),
('sh5', 'mov5', 'scr1', CURDATE(), '19:00:00'),

-- Tomorrow's shows
('sh6', 'mov2', 'scr1', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00'),
('sh7', 'mov3', 'scr2', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '13:30:00'),
('sh8', 'mov4', 'scr3', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:00:00'),
('sh9', 'mov5', 'scr4', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '18:30:00'),
('sh10', 'mov1', 'scr1', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '21:00:00'),

-- Day after tomorrow's shows
('sh11', 'mov3', 'scr1', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:00:00'),
('sh12', 'mov4', 'scr2', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:30:00'),
('sh13', 'mov5', 'scr3', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '17:00:00'),
('sh14', 'mov1', 'scr4', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '19:30:00'),
('sh15', 'mov2', 'scr1', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '22:00:00');

-- Insert seats for each screen (A1-F8 configuration for each screen) and link each seat to a specific ShowID
-- Make sure to update the ShowID after the Show table is populated
-- Insert seats for each screen and show combination (ensuring no duplicates)
INSERT INTO Seat (Seat_No, Screen_ID, Available, ShowID)
SELECT 
    CONCAT(
        CHAR(65 + (number DIV 8)), -- Letters A-F
        ((number % 8) + 1) -- Numbers 1-8
    ) AS Seat_No,
    screens.Screen_ID,  -- Explicitly specify Screen_ID from the Screen table
    TRUE AS Available,
    shows.ShowID  -- Explicitly specify ShowID from the Show table
FROM 
    (SELECT 0 AS number UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
     UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 
     UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 
     UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 
     UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 
     UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 
     UNION SELECT 30 UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 
     UNION SELECT 35 UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 
     UNION SELECT 40 UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 
     UNION SELECT 45 UNION SELECT 46 UNION SELECT 47) numbers
CROSS JOIN
    (SELECT Screen_ID FROM Screen) screens
CROSS JOIN
    (SELECT ShowID, Screen_ID FROM `Show`) shows
WHERE shows.Screen_ID = screens.Screen_ID
  AND NOT EXISTS (
      SELECT 1 
      FROM Seat 
      WHERE Seat.Seat_No = CONCAT(CHAR(65 + (numbers.number DIV 8)), ((numbers.number % 8) + 1)) 
        AND Seat.Screen_ID = screens.Screen_ID
        AND Seat.ShowID = shows.ShowID
  );



-- Insert some sample customers and bookings

-- Insert some sample bookings

-- Update seat availability for booked seats


DELIMITER $$

CREATE TRIGGER after_show_insert
AFTER INSERT ON `Show`
FOR EACH ROW
BEGIN
    -- Insert seat rows for the new show
    INSERT INTO Seat (Seat_No, Screen_ID, Available, ShowID)
    SELECT 
        CONCAT(
            CHAR(65 + (numbers.number DIV 8)), -- Letters A-F
            ((numbers.number % 8) + 1) -- Numbers 1-8
        ) AS Seat_No,
        screens.Screen_ID,  -- Explicitly specify Screen_ID from the Screen table
        TRUE AS Available,   -- All seats are initially available
        NEW.ShowID           -- Using the ShowID from the newly inserted Show record
    FROM 
        (SELECT 0 AS number UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 
         UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 
         UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 
         UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 
         UNION SELECT 25 UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 
         UNION SELECT 30 UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 
         UNION SELECT 35 UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 
         UNION SELECT 40 UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 
         UNION SELECT 45 UNION SELECT 46 UNION SELECT 47) numbers
    CROSS JOIN
        (SELECT Screen_ID FROM Screen WHERE Screen_ID = NEW.Screen_ID) screens
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Seat 
        WHERE Seat.Seat_No = CONCAT(CHAR(65 + (numbers.number DIV 8)), ((numbers.number % 8) + 1)) 
        AND Seat.Screen_ID = screens.Screen_ID
        AND Seat.ShowID = NEW.ShowID
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_seats_before_show_delete
BEFORE DELETE ON `Show`
FOR EACH ROW
BEGIN
    -- Delete all seats associated with the ShowID being deleted
    DELETE FROM Seat
    WHERE ShowID = OLD.ShowID;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetBookingReports()
BEGIN
    SELECT 
        t.TID, 
        c.FirstName, 
        c.LastName, 
        m.Name AS MovieName,
        s.Date, 
        s.Start_Time, 
        t.Seat_No
    FROM Ticket t
    JOIN `Show` s ON t.ShowID = s.ShowID
    JOIN Customer c ON t.CID = c.CID
    JOIN Movie m ON s.Movie_ID = m.Movie_ID;
END $$

DELIMITER ;
