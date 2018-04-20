# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord
	validates :user_id, presence: true
	validates :title, presence: true 
	validates :body, presence: true,length: { minimum: 250 }
	belongs_to :user
	has_many :comments
end
