require 'active_support/concern'

module Finders
  extend ActiveSupport::Concern

  included do
    scope :find_one, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

    scope :find_all, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase) }
  end
end
