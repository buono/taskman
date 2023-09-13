class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true
  validates :name, length: {maximum:10}

  belongs_to :user

  private
  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end