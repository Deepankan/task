class Shop < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :users
  validates :shop_name, presence: { :message => "Shop Name Can't be blank"}
  validates :shop_address, presence: { :message => "Shop Address Can't be blank"}
  validates :shop_description, presence: { :message => "Shop Description Can't be blank"}
  validates :avatar, presence: { :message => "Shop Image is mandatory"}


end
