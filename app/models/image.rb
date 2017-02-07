class Image < ActiveRecord::Base
  belongs_to :design, dependent: :destroy

  has_attached_file :image,
      :styles => { large: "900x650#" },
      
  validates_attachment_content_type :image,
    content_type: ["image/jpg","image/jpeg","image/png"]

end