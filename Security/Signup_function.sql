CREATE OR REPLACE FUNCTION
signup(username text, password text) RETURNS VOID
AS $$
  INSERT INTO users (username, password) VALUES
    (signup.username, signup.password);
$$ LANGUAGE sql SECURITY DEFINER;