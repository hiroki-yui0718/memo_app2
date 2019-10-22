class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :recent, -> {order(cerated_at: :desc)} #アロー演算子
end
