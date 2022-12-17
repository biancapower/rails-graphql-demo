class Types::CoordinatesType < Types::BaseObject
  description "A set of coordinates"
  field :latitude, Float, null: false
  field :longitude, Float, null: false

  def latitude
    object[0]
  end

  def longitude
    object[1]
  end
end
