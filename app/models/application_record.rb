# for more information see:
# https://guides.rubyonrails.org/active_record_basics.html
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
