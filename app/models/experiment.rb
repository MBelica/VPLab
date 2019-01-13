class Experiment < ApplicationRecord
  belongs_to :user

  enum form: %i[online onsite other]

  validates_presence_of :user_id, :title, :contact_name, :contact_email
  validates_uniqueness_of :title

  after_initialize :set_default_settings, if: :new_record?

  default_scope -> { order(created_at: :desc) }

  has_many :experimenter_assignments, dependent: :destroy
  has_many :experimenters, -> { distinct }, :through => :experimenter_assignments, :source => :user

  has_many :participations
  has_many :participants, -> { distinct }, :through => :participations, :source => :user

  has_many :sessions, -> { order(:start_at) }

  def ungrouped_sessions
    sessions.where(:session_group_id => nil)
  end

  def has_open_sessions?
    space_left > 0
  end

  def has_no_participants_in_grouped_sessions?
    return !has_participants_in_grouped_sessions?
  end

  def has_participants_in_grouped_sessions?
    session_groups.each do |group|
      if group.has_participants?
        return true
      end
    end
    return false
  end

  def open_sessions
    sessions.in_the_future.order('start_at').select{ |s| s.space_left > 0}
  end

  protected

  def space_left
    sessions.in_the_future.map { |s| s.space_left }.sum
  end

  private

  def set_default_settings
    begin
      o = [('a'..'z'), ('A'..'Z'), ('1'..'9')].map(&:to_a).flatten
      ky = (0...12).map { o[rand(o.length)] }.join
    end until Experiment.find_by(key: ky).nil?

    self.key  ||= ky
    self.form ||= :online
  end
end
