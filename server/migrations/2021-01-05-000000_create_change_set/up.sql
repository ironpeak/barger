CREATE TABLE change_sets (
  id SERIAL PRIMARY KEY,
  branch VARCHAR NOT NULL,
  commit VARCHAR NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TRIGGER set_updated_at
BEFORE UPDATE ON change_sets
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_updated_at();