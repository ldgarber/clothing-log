require 'active_support'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
