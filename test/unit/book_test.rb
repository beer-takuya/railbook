#coding: utf-8

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "book save" do
    book = Book.new({
      :isbn => '978-4-7741-4466-X',
      :title => 'Ruby on Rails本格入門',
      :price => 3100,
      :publish => '技術評論社',
      :published => '2011-02-14',
      :cd => false
    })
    assert book.save, 'Failed to save'
    
  end

  test "book validate" do

    book = Book.new({
      :isbn => '978-4-7741-44',
      :title => 'JavaScript本格入門',
      :price => 3100,
      :publish => '技術評論社',
      :published => '2011-01-14',
      :cd => false
    })
    assert !book.save, 'Failed to validate'
    assert_equal book.errors.size , 3 , 'Failed to validate count'
    assert book.errors[:isbn].any?, 'Failed to isbn validate'

  end

end
