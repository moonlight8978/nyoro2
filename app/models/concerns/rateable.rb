module Rateable
  extend ActiveSupport::Concern

  included do
    has_many :ratings,
      as: :rateable, class_name: 'Feature::Rating' do

      def given_by(user)
        @rated ||= RatingValue.new(user && self.find_by(user_id: user.id))
      end
    end

    has_many :rated_users,
      through: :ratings, class_name: 'User'

    def average_stars
      @average_stars ||= (ratings.average(:star) || '-')
    end
  end
end
