class Book < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :authors
  has_many :users, :through => :reviews
  
  after_destroy :history_book
  
  private 
  def history_book
    logger.info('deleted:' + self.inspect)
  end
end
