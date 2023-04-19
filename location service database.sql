drop table if exists Visits;
drop table if exists Users;
drop table if exists Historical_Events;
drop table if exists Locations;
CREATE TABLE Locations (
    name VARCHAR(255) NOT NULL PRIMARY KEY,
    description TEXT,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    image_url VARCHAR(255)
);


CREATE TABLE Historical_Events (
    name VARCHAR(255) NOT NULL PRIMARY KEY,
    description TEXT,
    date DATE NOT NULL,
    event_id INT
);


CREATE TABLE Users (
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    visited_locations TEXT,
    PRIMARY KEY (name, email)
);


CREATE TABLE Visits (
    user_name VARCHAR(255) NOT NULL,
    location_name VARCHAR(255) NOT NULL,
    visit_date TIMESTAMP NOT NULL,
    PRIMARY KEY (user_name, location_name),
    FOREIGN KEY (user_name) REFERENCES Users(name),
    FOREIGN KEY (location_name) REFERENCES Locations(name)
);

-- Insert sample locations
INSERT INTO locations (name, description, latitude, longitude)
VALUES
    ('The Campanile', 'A 217-foot bell tower located in the center of campus.', 33.773721, -84.396205),
    ('The Tech Tower', 'A 227-foot-tall administrative building that has been a symbol of Georgia Tech since it opened in 1888.', 33.772852, -84.391574),
    ('The Klaus Advanced Computing Building', 'A building on campus named after a former professor who was instrumental in developing Georgia Tech’s computing program.', 33.776608, -84.395097),
    ('The Robert C. Williams Museum of Papermaking', 'A museum dedicated to the history of paper and papermaking that is located on the Georgia Tech campus.', 33.776155, -84.387198),
    ('The Kendeda Building', 'A sustainable building on campus that is designed to be net positive energy and water.', 33.772249, -84.398297);

-- Insert sample events
INSERT INTO Historical_Events (name, description, date, event_id)
VALUES
    ('Bobby Dodd Stadium Opens', 'The first game at Bobby Dodd Stadium was played on September 27, 1913.', '1913-09-27', 1),
    ('Martin Luther King Jr. Speaks at Georgia Tech', 'Dr. Martin Luther King Jr. delivered a speech at Georgia Tech on April 26, 1967.', '1967-04-26', 2),
    ('Invention of the Internet Celebrated at Georgia Tech', 'On October 29, 2009, Georgia Tech hosted a celebration to commemorate the 40th anniversary of the invention of the Internet.', '2009-10-29', 3),
    ('Georgia Tech Wins the National Championship', 'The Georgia Tech football team won the national championship in 1990.', '1990-01-01', 1),
    ('The Varsity Restaurant Opens', 'The Varsity, a famous fast food restaurant located across from Georgia Tech, first opened its doors in 1928.', '1928-08-16', 5);

-- Insert sample users
INSERT INTO users (name, email, visited_locations)
VALUES
    ('John Doe', 'johndoe@example.com', '1,3,5'),
    ('Jane Smith', 'janesmith@example.com', '2,4'),
    ('Alex Lee', 'alexlee@example.com', '1,2,3,5'),
    ('Emily Kim', 'emilykim@example.com', '2,3,4'),
    ('Michael Chen', 'michaelchen@example.com', '1,4,5'),
    ('Sarah Park', 'sarahpark@example.com', '1,2,3,4,5'),
    ('David Lee', 'davidlee@example.com', '1,2,3');
