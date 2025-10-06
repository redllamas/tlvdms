class AddAutoIncrementVersionToDatasheetRevisions < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL
      CREATE OR REPLACE FUNCTION set_datasheet_revision_version()
      RETURNS TRIGGER AS $$
      DECLARE
        next_version integer;
      BEGIN
        IF NEW.version IS NULL THEN
          SELECT COALESCE(MAX(version) + 1, 1)
            INTO next_version
          FROM datasheet_revisions
          WHERE datasheet_id = NEW.datasheet_id
            AND region       = NEW.region
            AND locale       = NEW.locale;
          NEW.version := next_version;
        END IF;
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER trg_set_datasheet_revision_version
      BEFORE INSERT ON datasheet_revisions
      FOR EACH ROW
      EXECUTE FUNCTION set_datasheet_revision_version();
    SQL
  end

  def down
    execute <<~SQL
      DROP TRIGGER IF EXISTS trg_set_datasheet_revision_version ON datasheet_revisions;
      DROP FUNCTION IF EXISTS set_datasheet_revision_version();
    SQL
  end
end
