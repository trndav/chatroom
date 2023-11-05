class Room < ApplicationRecord
    validates_uniqueness_of :name 
    scope :public_rooms, -> {where(is_private: false)}

     # After new record is committed to database added/brodcasted to "rooms" section in webpage realtime
    after_create_commit { broadcast_append_to "rooms" }
end
