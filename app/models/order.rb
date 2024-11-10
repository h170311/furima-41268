class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :number, :expiry, :cvc, :postcode, :prefecture_id, :municipalities, :street_address,
                :telephone, :building_name

  validates :number,  presence: true
  validates :expiry,  presence: true
  validates :cvc,     presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  validates :postcode,        presence: true,
                              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :municipalities,  presence: true
  validates :street_address,  presence: true
  validates :telephone,       presence: true

  def save
    Buy.create(user_id:, item_id:, number:, expiry:, cvc:)
    Buyer_address.create(postcode:, prefecture_id:, municipalities:,
                         street_address:, telephone:)
  end
end
