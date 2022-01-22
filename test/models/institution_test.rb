require "test_helper"

class InstitutionTest < ActiveSupport::TestCase

  def setup
    @institution = Institution.new(name: "Wisconsin Univerity", location: "Legon")
  end

  test "should be valid" do
    assert @institution.valid?
  end
  
end
