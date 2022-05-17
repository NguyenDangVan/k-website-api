class Client < ApplicationRecord
  after_create :generate_uid

  def generate_uid
    self.uid = Random.hex
    self.save
  end
end
