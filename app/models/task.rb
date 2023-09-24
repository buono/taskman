class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true
  validates :name, length: {maximum:10}

  belongs_to :user

  scope :recent, -> {order(created_at: :desc)}

  #Ransack V4.0.0以降から必要になった箇所。検索のためにホワイトリストの登録が必要
  #ここから
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
    #["created_at", "description", "id", "name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  #ここまで

  private
  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end