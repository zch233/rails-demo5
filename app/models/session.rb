class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :user

  validates_presence_of :email, :password
  validates_format_of :email, with: /.+@.+/, if: :email, allow_blank: true
  validate :check_email, if: Proc.new {|s| s.email.present?}
  validates_length_of :password, minimum: 6, if: :password
  validate :check_password, if: Proc.new {|s| s.email.present? and s.password.present?}
  # validate :check_password, if: lambda { password.present? && email.present? }

  def check_email
    self.user ||= User.find_by_email email
    if self.user.nil?
      errors.add :email, :not_fount
    end
  end
  def check_password
    self.user ||= User.find_by_email email
    if self.user and !user.authenticate(password)
      errors.add :password, :mismatch
    end
  end
end
