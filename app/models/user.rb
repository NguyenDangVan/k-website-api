# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # == Constants ============================================================
  # == Attributes ===========================================================
  mount_uploader :avatar, AvatarUploader

  # == Extensions ===========================================================
  # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  self.skip_session_storage = %i[http_auth params_auth]

  # == Scopes ===============================================================
  # == Relationships ========================================================
  # == Validations ==========================================================
  validates :email, presence: true, uniqueness: true
  # == Callbacks ============================================================
  # == Class Methods ========================================================
  # == Instance Methods =====================================================
end
