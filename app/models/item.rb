class Item < ActiveRecord::Base
  belongs_to :user

  # if completed_at is not null

  def completed?
    !completed_at.blank?
  end
end
