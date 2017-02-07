class Image < ActiveRecord::Base
  belongs_to :design, dependent: :destroy

  has_attached_file :image,
      :styles => { large: "900x650#" },
                    :storage => :s3,
                    :s3_permissions => :private,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":class/:attachment/:id/:style.:extension"

  validates_attachment_content_type :image,
    content_type: ["image/jpg","image/jpeg","image/png"]

end