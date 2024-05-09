class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validate :has_no_bookmarks

  has_many :bookmarks

  private

  def has_no_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot destroy a moviw as it has associated bookmarks")
      throw(:abort)
    end
  end
end
