# frozen_string_literal: true

require "test_helper"

class InstitutionTest < ActiveSupport::TestCase
  def setup
    @institution = Institution.new(name: "Wisconsin Univerity", location: "Legon")
  end

  test "should be valid" do
    assert @institution.valid?
  end

  test "name should be present" do
    @institution.name = " "
    assert_not @institution.valid?
  end

  test "location should be present" do
    @institution.location = " "
    assert_not @institution.valid?
  end

  test "name should not be too long" do
    @institution.name = "a" * 51
    assert_not @institution.valid?
  end

  test "location should not be too long" do
    @institution.location = "a" * 51
    assert_not @institution.valid?
  end
end
