class User < ApplicationRecord
  scope :last_updated, -> { order(updated_at: :desc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save :downcase_email

  validates :name, presence: true
  
  validates :email, presence: true, 
                    fromat: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  self.per_page = 25

  private
    def downcase_email
      email.downcase!
    end
end
