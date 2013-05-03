require 'test_helper'
require 'domain_mapper'

module DomainMapper
  class DemoClass
    attr_reader :first_instance_variable, :other_instance_variable
  end

  describe Map do
    describe "flat data hash" do
      before do
        @map = Map.new(DemoClass) do
          attribute :first_instance_variable, "hash key"
          attribute :other_instance_variable, "other hash key"
        end
        @data_hash = {
          "hash key" => "first value",
          "other hash key" => 4
        }
      end

      describe "#build_object" do
        it "should build object of given type" do
          assert_instance_of DemoClass, @map.build_object(@data_hash)
        end

        it "should set given instance variables" do
          object = @map.build_object(@data_hash)
          assert_equal "first value", object.first_instance_variable
          assert_equal 4, object.other_instance_variable
        end
      end

      describe "#serialize" do
        before do
          @object = DemoClass.new
          @object.instance_variable_set(:@first_instance_variable, "kaka")
          @object.instance_variable_set(:@other_instance_variable, 1)
        end

        it "should return hash" do
          assert_instance_of Hash, @map.serialize(@object)
        end

        it "should have declared keys with values from instance variables" do
          hash = @map.serialize(@object)
          assert_equal "kaka", hash["hash key"]
          assert_equal 1, hash["other hash key"]
        end
      end
    end
  end
end
