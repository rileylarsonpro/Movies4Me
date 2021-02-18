ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS review_policy ON reviews;
CREATE POLICY review_policy ON reviews
    USING (TRUE)
    WITH CHECK (userid = current_setting('request.jwt.claim.user_id')::INTEGER);