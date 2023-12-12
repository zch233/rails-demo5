class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates_presence_of :email, :password
  validates_format_of :email, with: /.+@.+/, if: :email, allow_blank: true
  validate :check_email, if: :email
  validates_length_of :password, minimum: 6, if: :password

  def check_email
    u = User.find_by_email email
    if u.nil?
      errors.add :email, :not_fount
    end
  end
end
