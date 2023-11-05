class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, ->(user) { where.not(id: user) }
  # Maybe this would do the same
  # User.all_except(current_user)

  # After new record is committed to database added/brodcasted to "users" section in webpage realtime
  after_create_commit { broadcast_append_to "users" }
end
