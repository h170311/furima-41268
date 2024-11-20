class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buy_id, :postcode, :prefecture_id, :municipalities, :street_address,
                :telephone, :building_name, :token

  validates :token,   presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postcode,        presence: true,
                              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :municipalities,  presence: true
  validates :street_address,  presence: true
  validates :telephone,       presence: true,
                              format: { with: /\A[0-9]{10,11}+\z/, message: 'is invalid. Input half-width characters.' }
  def save
    buy = Buy.create(user_id:, item_id:)
    BuyerAddress.create(buy_id: buy.id, postcode:, prefecture_id:, municipalities:, street_address:, telephone:)
  end
end