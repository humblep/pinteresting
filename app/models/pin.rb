class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/dif", "image/gif"] }

	validates :image, presence: true
  validates :description, presence: true


  def shirts
  	shirts = []
  	Pin.each do |pin|
  		if shirt?(pin)
  			shirts << pin
  		end
  		shirt
  	end
  end

  
  def shirt?(pin)
  	if pin.type == "shirts"
  		true
  	else
  		false
  	end
  end
end

