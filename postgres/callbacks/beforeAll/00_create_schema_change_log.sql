CREATE TABLE IF NOT EXISTS schema_change_log (
    seq SERIAL PRIMARY KEY,
    op TEXT NOT NULL
);

INSERT INTO schema_change_log (op) VALUES ('beforeAll 00_create_schema_change_log.sql');