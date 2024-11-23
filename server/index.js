// Required dependencies
const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');

const app = express();
app.use(cors({
  origin:"http://localhost:3000"}
));
app.use(express.json());

// Database connection configuration
const pool = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: 'aneesh200',
  database: 'theatre_management',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Movies endpoints
app.get('/api/movies', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM Movie');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Shows endpoints
app.get('/api/shows', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT s.*, m.Name as MovieName, m.Duration, m.Genre, 
             sc.Screen_No, sc.Type as ScreenType
      FROM \`Show\` s
      JOIN Movie m ON s.Movie_ID = m.Movie_ID
      JOIN Screen sc ON s.Screen_ID = sc.Screen_ID
      ORDER BY s.Date, s.Start_Time
    `);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Seats availability endpoint
app.get('/api/shows/:showId/seats', async (req, res) => {
  try {
    const [rows] = await pool.query(`
    SELECT 
    s.Seat_No, 
    s.Available, 
    CASE 
      WHEN t.TID IS NOT NULL THEN false  
      ELSE s.Available                    
    END AS IsAvailable,
    s.ShowID,
    s.Screen_ID
  FROM Seat s
  LEFT JOIN Ticket t 
    ON t.ShowID = s.ShowID 
    AND t.Seat_No = s.Seat_No 
    AND t.Screen_ID = s.Screen_ID
  WHERE s.ShowID = ?;  
  
    `, [req.params.showId]);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Book ticket endpoint
app.post('/api/bookings', async (req, res) => {
  const connection = await pool.getConnection();
  try {
    await connection.beginTransaction();

    const { userId, showId, customerId, seatNo, screenId } = req.body;
    const [seatCheck] = await connection.query(`
      SELECT Available 
      FROM Seat 
      WHERE Seat_No = ? 
        AND Screen_ID = ? 
        AND ShowID = ? 
        AND Available = true
    `, [seatNo, screenId, showId]);

    if (seatCheck.length === 0) {
      throw new Error('Seat not available for the selected show');
    }

    const ticketId = uuidv4();
    await connection.query(`
      INSERT INTO Ticket (TID, ShowID, CID, Seat_No, Screen_ID, Price, UserID)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `, [ticketId, showId, customerId, seatNo, screenId, 10.00, userId]);

    await connection.query(`
      UPDATE Seat 
      SET Available = false 
      WHERE Seat_No = ? 
        AND Screen_ID = ? 
        AND ShowID = ?
    `, [seatNo, screenId, showId]);
    await connection.commit();
    res.json({ ticketId, message: 'Booking successful' });
  } catch (error) {
    console.error("Error during booking:", error); 
    await connection.rollback();
    res.status(500).json({ error: error.message });
  } finally {
    connection.release();
  }
});



// Customer registration endpoint
app.post('/api/customers', async (req, res) => {
  try {
    const { firstName, lastName, age } = req.body;
    const customerId = uuidv4();
    await pool.query(`
      INSERT INTO Customer (CID, FirstName, LastName, Age)
      VALUES (?, ?, ?, ?)
    `, [customerId, firstName, lastName, age]);

    res.json({ customerId, message: 'Customer registered successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/reports/revenue', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT m.Name, COUNT(t.TID) as TicketsSold,
             SUM(t.Price) as TotalRevenue
      FROM Movie m
      JOIN \`Show\` s ON m.Movie_ID = s.Movie_ID
      JOIN Ticket t ON s.ShowID = t.ShowID
      GROUP BY m.Movie_ID, m.Name
    `);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Available Seats (Nested Query)
app.get('/api/reports/available-seats', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT 
        s.ShowID, 
        m.Name as MovieName, 
        s.Date, 
        s.Start_Time, 
        COUNT(st.Seat_No) as AvailableSeats
      FROM \`Show\` s
      JOIN Movie m ON s.Movie_ID = m.Movie_ID
      LEFT JOIN Seat st ON st.ShowID = s.ShowID AND st.Available = true
      GROUP BY s.ShowID, m.Name, s.Date, s.Start_Time
    `);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


// Booking Details (Join Query)
app.get('/api/reports/bookings', async (req, res) => {
  try {
    const [rows] = await pool.query('CALL GetBookingReports()');
    res.json(rows[0]); // The result of a `CALL` query is an array with the first element containing the rows
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.post('/api/add-show', async (req, res) => {
  try {
    const { ShowID, Movie_ID, Screen_ID, Date, Start_Time } = req.body;
    await pool.query(`
    INSERT INTO \`Show\`(ShowID,Movie_ID,Screen_ID,Date,Start_Time)
    VALUES (?, ?, ?, ?, ?);
  `, [ShowID,Movie_ID,Screen_ID,Date,Start_Time]);
    res.json({ ShowID, message: 'Show added successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/add-movie', async (req, res) => {
  try {
    const { Movie_ID, Name, Duration, Genre } = req.body;
    await pool.query(`
    INSERT INTO Movie (Movie_ID,Name,Duration,Genre)
    VALUES (?, ?, ?, ?);
  `, [Movie_ID,Name,Duration,Genre]);
    res.json({ message: 'Movie added successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;
  const connection = await pool.getConnection();

  try {
    const [user] = await connection.query(
      'SELECT * FROM Users WHERE Username = ? AND Password = ?',
      [username, password]
    );

    if (user.length > 0) {
      res.json({ success: true, userId: user[0].UserID, role: user[0].Role});
    } else {
      res.json({ success: false });
    }
  } catch (error) {
    res.status(500).send('Error logging in');
  } finally {
    connection.release();
  }
});

app.post('/api/register-customer', async (req, res) => {
  const { username, password } = req.body;

  try {
    const [existingUser] = await pool.query('SELECT * FROM Users WHERE Username = ?', [username]);

    if (existingUser.length > 0) {
      return res.status(400).json({ success: false, message: 'Username already exists' });
    }
    const userId = uuidv4(); // Generate a new unique user ID
    const [result] = await pool.query('INSERT INTO Users (UserID, Username, Password, Role) VALUES (?, ?, ?, ?)', [
      userId,
      username,
      password,
      'customer', // Role is hardcoded as 'customer'
    ]);

    res.json({ success: true, userId });
  } catch (error) {
    console.error('Registration failed:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/api/register-admin', async (req, res) => {
  const { username, password } = req.body;

  try {
    const [existingUser] = await pool.query('SELECT * FROM Users WHERE Username = ?', [username]);

    if (existingUser.length > 0) {
      return res.status(400).json({ success: false, message: 'Username already exists' });
    }
    const userId = uuidv4(); // Generate a new unique user ID
    const [result] = await pool.query('INSERT INTO Users (UserID, Username, Password, Role) VALUES (?, ?, ?, ?)', [
      userId,
      username,
      password,
      'admin',
    ]);

    res.json({ success: true, userId });
  } catch (error) {
    console.error('Registration failed:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/users', async (req, res) => {
  try {
    const [users] = await pool.query('SELECT * FROM Users');
    res.json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/bookings/:customerId', async (req, res) => {
  const customerId = req.params.customerId;
  
  const connection = await pool.getConnection();
  try {
    // Query to fetch all booked tickets for the given customer
    const query = `
      SELECT DISTINCT
        t.TID AS ticketId,
        m.Name AS movieName,
        sh.Date AS showDate,
        sh.Start_Time AS showTime,
        t.Seat_No AS seatNo,
        t.Screen_ID AS screenNo
      FROM 
        Ticket t
      JOIN 
        \`Show\` sh ON t.ShowID = sh.ShowID
      JOIN 
        Movie m ON sh.Movie_ID = m.Movie_ID
      JOIN 
        Seat se ON t.Seat_No = se.Seat_No AND t.Screen_ID = se.Screen_ID
      WHERE 
        t.UserID = ?
    `;

    const [bookedTickets] = await connection.query(query, [customerId]);
    res.json(bookedTickets);  // Return the booked tickets

  } catch (error) {
    console.error('Error fetching booked tickets:', error);
    res.status(500).json({ error: 'An error occurred while fetching the booked tickets.' });
  } finally {
    connection.release();
  }
});

// Edit Movie
app.put('/api/edit-movie/:movieID', async (req, res) => {
  const { movieID } = req.params;
  const { Name, Duration, Genre } = req.body;

  try {
    const result = await pool.query(
      'UPDATE Movie SET Name = ?, Duration = ?, Genre = ? WHERE Movie_ID = ?',
      [Name, Duration, Genre, movieID]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    res.json({ message: 'Movie updated successfully' });
  } catch (error) {
    console.error('Error updating movie:', error);
    res.status(500).json({ error: error.message });
  }
});

// Delete Movie
app.delete('/api/delete-movie/:movieID', async (req, res) => {
  const { movieID } = req.params;

  try {
    const result = await pool.query('DELETE FROM Movie WHERE Movie_ID = ?', [movieID]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    res.json({ message: 'Movie deleted successfully' });
  } catch (error) {
    console.error('Error deleting movie:', error);
    res.status(500).json({ error: error.message });
  }
});


app.delete('/api/delete-show/:showID', async (req, res) => {
  const { showID } = req.params;
  try {
    console.log(showID)
    const result = await pool.query(`DELETE FROM \`Show\` WHERE ShowID = ?`, [showID]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Show not found' });
    }
    res.json({ message: 'Show deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put('/api/edit-show/:showID', async (req, res) => {
  const { showID } = req.params;
  const { Movie_ID, Screen_ID, Date, Start_Time } = req.body;
  try {
    const result = await pool.query(
      `UPDATE \`Show\` SET Movie_ID = ?, Screen_ID = ?, Date = ?, Start_Time = ? WHERE ShowID = ?`,
      [Movie_ID, Screen_ID, Date, Start_Time, showID]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Show not found' });
    }
    res.json({ message: 'Show updated successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});




const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});