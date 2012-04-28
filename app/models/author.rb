#coding : utf-8
class Author < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books
  
  validate :file_invalid?
  
  def data=(data)
    self.ctype = data.content_type
    self.photo = dta.read
  end
  
  private 
  def file_invalid?
    ps = ['image/jpeg', 'image/gif', 'image/png']
    errors.add(:photo, 'は画像ファイルではありません') if !ps.include?(self.ctype)
    errors.add(:photo, 'のサイズが1mbを越えています' ) if self.photo.length > 1.megabyte
  end
  
end
