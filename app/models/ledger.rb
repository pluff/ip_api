class Ledger < ActiveRecord::Base
  has_many :exchanges, dependent: :destroy
  has_many :remittances, dependent: :destroy

  scope :accessible, lambda { where.not(access_token: nil) }

  validates :access_token, presence: true

  before_validation :ensure_access_token

  def to_param
    access_token
  end

  private

  def ensure_access_token
    while access_token.blank?
      token = Digest::SHA1.hexdigest "#{Time.now}#{rand(10000000)}".split('').shuffle!.join
      self.access_token = token unless Ledger.exists?(access_token: token)
    end
  end
end
