class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, ->(user) { where.not(id: user) }
  # Maybe this would do the same User.all_except(current_user)

  # After new record is committed to database added/brodcasted to "users" section in webpage realtime
  after_create_commit { broadcast_append_to "users" }
  # broadcast for status broadcast_update is method defined bellow
  after_update_commit { broadcast_update }

  enum status: %i[offline away online]

  has_many :messages
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail 
    avatar.variant(resize_to_limit: [140, 140]).processed
  end

  def chat_avatar 
    avatar.variant(resize_to_limit: [50, 50]).processed
  end

  def broadcast_update
    broadcast_replace_to "user_status", partial: "users/status", user: self
  end

  # in view we can call this method
  def status_to_css
    case status 
    when "online"
      "bg-success"
    when "away"
      "bg-warning"
    when "offline "
      "bg-danger"
    else
      "bg-danger"
    end
  end

  private

  def add_default_avatar 
    return if avatar.attached?
      avatar.attach(
        io: File.open(Rails.root.join("app", "assets", "images", "default_avatar.png")),
        filename: "default_avatar.png",
        content_type: "image/png"
      )
  end
end
