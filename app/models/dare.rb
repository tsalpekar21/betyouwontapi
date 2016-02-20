class Dare < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'created_at', dependent: :destroy
end
