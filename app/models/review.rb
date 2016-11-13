class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes


  validates :body, presence: true, length: {minimum: 2}
  validates :star_count, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}


# check to see whether the user has liked this view before or not:
  def like_for(user)
    likes.find_by_user_id(user)
  end

end
