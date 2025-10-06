# app/models/datasheet.rb
class Datasheet < ApplicationRecord
  enum :status, { draft: 0, active: 1, hidden: 2, discontinued: 3 }, default: :active

  has_many :product_datasheets, dependent: :destroy
  has_many :products, through: :product_datasheets

  has_many :datasheet_revisions, dependent: :destroy

  # Convenience: fetch most recent active revision for a region/locale
  def latest_revision(region:, locale:)
    datasheet_revisions
      .where(region: region, locale: locale, status: DatasheetRevision.statuses[:active])
      .order(version: :desc, published_at: :desc, updated_at: :desc)
      .first
  end
end
