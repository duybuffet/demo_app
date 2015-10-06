require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:michael)
  	@entry = @user.entries.build(title: "Hello world", content: "Lorem ipsum", 
  		user_id: @user.id)
  end

  test "should be valid" do
  	assert @entry.valid?
  end

  test "user id should be present" do
  	@entry.user_id = nil
  	assert_not @entry.valid?
  end

  test "content should be present" do
  	@entry.content = "   "
  	assert_not @entry.valid?
  end

  test "title should be present" do
  	@entry.title = "  "
  	assert_not @entry.valid?
  end

  test "content should be at most 140 chars" do
  	@entry.content = "a" * 141
  	assert_not @entry.valid?
  end

  test "title should be at most 20 chars" do
  	@entry.title = "a" * 21
  	assert_not @entry.valid?
  end

  test "order should be most recent first" do
  	assert_equal entries(:most_recent), Entry.first
  end

  test "assiociated entries should be destroyed" do
  	@user.save
  	@user.entries.create!(title: "hello world", content: "lorem ipsum")
  	assert_difference 'Entry.count', -1 do
  		@user.destroy
  	end
  end
end
