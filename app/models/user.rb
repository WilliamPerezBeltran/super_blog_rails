# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	has_secure_password validations: false
	validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
	validates :password, presence: true 
	validates :name, presence: true 
	has_many :posts
	has_many :comments
end
