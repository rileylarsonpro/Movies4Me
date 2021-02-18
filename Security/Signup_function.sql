CREATE OR REPLACE FUNCTION public.signup(IN username text,IN password text)
    RETURNS void
    LANGUAGE 'sql'
    VOLATILE SECURITY DEFINER
    PARALLEL UNSAFE
    COST 100
AS $BODY$
INSERT INTO users (username, password) VALUES
    (signup.username, crypt(signup.password, gen_salt('md5')));
$BODY$;