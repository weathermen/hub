class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable, :timeoutable
end
