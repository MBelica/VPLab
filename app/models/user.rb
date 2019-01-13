class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :registerable, :recoverable,
         :rememberable, :validatable, :lockable, :timeoutable, :trackable, :omniauthable

  APPROVED_DOMAINS = %w[uni-landau.de student.kit.edu gmail.com icloud.com].freeze
  enum role: %i[student moderator admin]
  attr_encrypted :email, key: [ENV["GENERAL_ENCRYPTION_KEY"]].pack("H*")
  attr_encrypted :firstname, key: [ENV["GENERAL_ENCRYPTION_KEY"]].pack("H*")
  attr_encrypted :lastname, key: [ENV["GENERAL_ENCRYPTION_KEY"]].pack("H*")
  attr_encrypted :matrikel, key: [ENV["GENERAL_ENCRYPTION_KEY"]].pack("H*")
  attr_encrypted :birthday, key: [ENV["GENERAL_ENCRYPTION_KEY"]].pack("H*")
  blind_index :email, key: [ENV["BLIND_INDEX_KEY"]].pack("H*")

  before_validation :downcase_email
  validates :matrikel, presence: true, if: :matrikel_uniqueness_check, on: :create
  validates :email, presence: true, if: :email_domain_and_uniqueness_check, on: :create

  validates_presence_of :firstname, :lastname
  validates_acceptance_of :terms, on: :create, allow_nil: false

  after_initialize :set_default_settings, if: :new_record?

  has_many :experimenter_assignments, dependent: :destroy
  has_many :experiments, through: :experimenter_assignments, source: :experiment

  has_many :participations
  has_many :participating_experiments, :through => :participations, :source => :experiment

  has_many :session_participations
  has_many :sessions, :through => :session_participations


  def user?
    role == 'student' || role == 'moderator' || role == 'admin'
  end

  def mod?
    role == 'moderator' || role == 'admin'
  end

  def to_s
    [self.firstname, self.lastname].reject(&:blank?).join(" ")
  end

  private

  def downcase_email
    self.email = self.email.downcase
  end

  def matrikel_uniqueness_check
    users = User.all
    users.each do |user|
      errors.add(:matrikel, 'already taken') if user.matrikel.to_s == matrikel.to_s
    end
  end

  def email_domain_and_uniqueness_check

    users = User.all
    users.each do |user|
      errors.add(:email, 'already taken') if user.email.downcase == email.downcase
    end

    if role == 'student'
      errors.add(:email, 'is not from a valid domain') unless APPROVED_DOMAINS.any? {|word| email.end_with?(word)}
    end
  end

  # enables: user.lecturer?  user.lecturer!  user.role  user.student?
  def set_default_settings
    begin
      o = [('a'..'z')].map(&:to_a).flatten
      cd = (0...6).map { o[rand(o.length)] }.join
    end until User.find_by(code: cd).nil?

    self.code ||= cd
    self.role ||= :student
  end

  def index_encryption_key
    [ENV["BLIND_INDEX_KEY"]]
  end

  def general_encryption_key
    [ENV["ENCRYPTION_KEY"]]
  end
end