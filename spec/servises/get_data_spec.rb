require 'rails_helper'

RSpec.describe Unamo::GetData do
  describe '.campains' do
    array_of_campains = [
      {
        "id": 1,
        "account_id": 1,
        "name": "example.com",
        "title": "Example",
        "active": true,
        "created_at": "2016-02-22T16:27:23.400Z"
      },
      {
        "id": 2,
        "account_id": 2,
        "name": "name.com",
        "title": "Next_Example",
        "active": true,
        "created_at": "2017-10-22T21:01:05.400Z"
      }
    ]

    array_of_keywords = [
      {
        "id" => 1,
        "groups" => [1, 2],
        "website_id" => 1,
        "name" => "example",
        "created_at" => "2016-02-22T16:27:23.400Z"
      },
      {
        "id" => 5,
        "groups" => [],
        "website_id" => 5,
        "name" => "next_example",
        "created_at" => "2016-02-22T16:27:23.400Z"
      }
    ]

    array_of_groups = [
      {
        "id" => 1,
        "website_id" => 1,
        "name" => "Example",
        "created_at" => "2017-05-17T00:40:17+02:00"
      },
      {
        "id" => 2,
        "website_id" => 2,
        "name" => "Example_next",
        "created_at" => "2017-05-17T00:40:17+02:00"
      }
    ]

    array_of_campain_positions = {
      "id" => 1,
      "name" => "example.com",
      "mobile" => false,
      "date_from" => 2017-05-12,
      "date_to" => 2017-05-16,
      "keywords" => [
        {
          "id" => 1,
          "name" => "example",
          "positions" => {
            "2017-05-12": 66,
            "2017-05-13": 50,
            "2017-05-14": 72,
            "2017-05-15": 38,
            "2017-05-16": 54
          }
        }
      ]
    }

    it 'maps downloaded array of hashes' do
      allow(Unamo::Client).to receive(:campains).and_return(array_of_campains)
      campains = Unamo::GetData.campains

      expect(campains[0].is_a?(Unamo::Campain)).to eq(true)
      expect(campains[1].is_a?(Unamo::Campain)).to eq(true)
      expect(campains[0].id).to eq(1)
      expect(campains[1].id).to eq(2)
      expect(campains[0].title).to eq("Example")
      expect(campains[1].title).to eq("Next_Example")
    end

    it 'maps downloaded empty array' do
      array_of_campains = []
      allow(Unamo::Client).to receive(:campains).and_return(array_of_campains)
      campains = Unamo::GetData.campains
      expect(campains).to eq([])
    end
  end

  describe '.keywords' do
    it 'returns all keywords' do
      id = 1

      allow(Unamo::Client).to receive(:keywords).and_return(array_of_keywords)
      allow(Unamo::Client).to receive(:groups).and_return(array_of_groups)
      allow(Unamo::Client).to receive(:campain_positions).and_return(array_of_campain_positions)
      keywords = Unamo::GetData.keywords(id)

      expect(keywords[0].is_a?(Unamo::Keyword)).to eq(true)
      expect(keywords[1].is_a?(Unamo::Keyword)).to eq(true)
      expect(keywords[0].name).to eq("example")
      expect(keywords[1].name).to eq("next_example")
      expect(keywords[0].worst_position).to eq(72)
      expect(keywords[1].worst_position).to eq(nil)
    end
  end
end
