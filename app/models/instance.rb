class Instance < ApplicationRecord
  validates :host, presence: true, uniqueness: true
  validates :version, presence: true
end
