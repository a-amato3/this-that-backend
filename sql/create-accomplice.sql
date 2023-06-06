CREATE TABLE Accomplice (
  id SERIAL PRIMARY KEY,
  character_id INTEGER REFERENCES Character(id) ON DELETE CASCADE,
  accomplice_id INTEGER REFERENCES Character(id) ON DELETE CASCADE
);

