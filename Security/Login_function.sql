CREATE OR REPLACE FUNCTION public.login(IN username text,IN password text)
    RETURNS jwt_token
    LANGUAGE 'plpgsql'
    VOLATILE SECURITY DEFINER
    PARALLEL UNSAFE
    COST 100
AS $BODY$
DECLARE
  _role NAME;
  result jwt_token;
BEGIN
  SELECT users.userid FROM users WHERE users.username=login.username AND users.password = crypt(login.password, users.password) INTO _role;
  IF _role IS NULL THEN
    RAISE invalid_password USING message = 'invalid user or password';
  END IF;

  SELECT sign(
      row_to_json(r), current_setting('app.settings.jwt_secret')
    ) AS token
    from (
      SELECT 'admins' AS role, login.username AS username, _role AS user_id,
         extract(epoch from now())::integer + 3600*60*60 as exp
    ) r
    INTO result;

  RETURN result;
END;
$BODY$;