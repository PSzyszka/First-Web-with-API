require 'rails_helper'

RSpec.describe Unamo::Base do
  describe '#initialize' do
    class Test < Unamo::Base
      attr_accessor :parking_name, :id
    end

    it 'assigns value for variable' do
      arg = { "ParkingName" => "New place to rent", "id" => 1, "localization" => "New York" }
      example_test = Test.new(arg)
      expect(example_test.id).to eq(1)
      expect(example_test.parking_name).to eq("New place to rent")
      expect(example_test.try(:localization)).to eq(nil)
    end
  end
end
