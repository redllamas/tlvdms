# app/models/datasheet_revision.rb
class DatasheetRevision < ApplicationRecord
  enum :status, { draft: 0, active: 1, hidden: 2, discontinued: 3 }, default: :active

  belongs_to :datasheet

  # Duplicate helper for versioning
  def duplicate(new_version: nil)
    copy = dup
    copy.version = new_version # leave nil to let DB trigger assign MAX+1
    copy.status  = :draft
    copy.published_at = nil
    copy.save!
    copy
  end
end
