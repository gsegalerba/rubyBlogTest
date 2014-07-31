# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
