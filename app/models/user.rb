class User < ApplicationRecord
  after_create :send_welcome_email, :send_new_registration, :set_geolocation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :annonces, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_one :agent, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :prénom, :nom, :ville, presence: true
  has_friendship
  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
  has_many :orders, dependent: :destroy
  has_many :mandats, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  has_many :reviews
  acts_as_messageable

  include PgSearch::Model
  pg_search_scope :search_agent,
    against: [ :nom, :prénom, :adresse, :ville, :civilité, :téléphone],
  using: {
    tsearch: { prefix: true }
  }

  def mailboxer_name
    email
  end

  def mailboxer_email(object)
    email
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def send_new_registration
    mail = UserMailer.with(user: self).new_registration
    mail.deliver_now
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    # Create a notification
    Notification.create(recipient: @admin, actor: self, action: "new_registration", notifiable: self)
  end

  def set_geolocation
    @user = self
    if @user.latitude == nil or @user.longitude == nil
      results = Geocoder.search("#{@user.ville}")
      @user.latitude = results.first.coordinates[0]
      @user.longitude = results.first.coordinates[1]
      @user.save
    end
  end
end
