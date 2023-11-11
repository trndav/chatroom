module RoomsHelper
    def search_rooms
        if params.dig(:name_search).present && params.dig(:name_search).length > 0
            Room.public_rooms
            # Bc of using postgress needs to be ILIKE
            .where("name ILIKE ?", "%#{params.dig(name:_search)}%")
            .order(name: :asc)
        else
            []
        end
    end
end
