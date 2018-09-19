class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :beneficiary

  validates :notes, presence: true
  validates :user_id, presence: true
  validates :beneficiary_id, presence: true
  validates :date, presence: true

  scope :incomplete, -> { where(complete: false) }
  scope :late, -> { where('date < ?', 1.week.ago) }

  def formatted_date
    date.strftime("%B %d, %Y")
  end

end
