# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Article < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5 }
end
