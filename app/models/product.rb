class Product < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_products, through: :favorites, source: :user


  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :category
  # error because it's trying to look up category from this product and it doesn't that association in the model

  has_many :reviews, dependent: :destroy
  # dependent option is very important for data consistency. Can pass it :destroy or :nullify
  validates :title, presence: true, uniqueness: {case_sensitive: false, message: 'must be unique'}
  # validates :title, :presence => true, :uniqueness => true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true, length: {minimum: 10}

  validates :category, presence: true
  # can't save
  after_initialize :set_defaults
  before_save :capitalize_title

  def self.search(keyword)
  where(["title ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorite_for(user)
    favorites.find_by_user_id(user)
  end

  def user_full_name
    if user
      user.full_name
    else
      'Anonymous'
    end
  end

  private

  def set_defaults
    self.price ||=1
  end

  def capitalize_title
    self.title.capitalize!
  end
end
