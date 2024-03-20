class Email < ApplicationRecord
  belongs_to :template, optional: true
end
