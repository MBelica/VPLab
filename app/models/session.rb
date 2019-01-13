class Session < ApplicationRecord

  belongs_to :experiment
  has_many :session_participations

  validates_presence_of :start_at
  validates_presence_of :end_at

  validates_numericality_of :needed, :only_integer => true
  validates_numericality_of :reserve, :only_integer => true

  def in_the_future
    Session.where("start_at > NOW()")
  end

  def in_the_past
    Session.where("end_at < NOW()")
  end

  def self.session_times
    (0..23).to_a.product(["00","15","30","45"]).collect{|t| ("%02d:%02d" % t)}
  end

  def duration
    begin
      (end_at - start_at).round / 60
    rescue
      90
    end
  end

  def has_no_participants?
    return !has_participants?
  end

  def has_participants?
    return session_participations.count != 0
  end

  def space_left
    needed + reserve - session_participations.count
  end

  def time_str
    start_at + ' - ' + end_at
  end

  def only_time_str
    I18n.l(start_at, :format => :time_only) + ' - ' + I18n.l(end_at, :format => :time_only)
  end

  def end_date
    end_at.to_date if start_at
  end

  def start_date
    start_at.to_date if start_at
  end

  def to_s
    experiment.name + ' (' + self.time_str + ')'
  end
end
