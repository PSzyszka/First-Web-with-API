require Rails.root.join('lib', 'unamo', 'client')

module Unamo
  class GetData
    class << self
      def campains
        args = Unamo::Client.campains
        args.map { |arg| Unamo::Campain.new(arg) }
      end

      def keywords(id, period)
        keywords = Unamo::Client.keywords(id)
        groups = Unamo::Client.groups(id)
        campain_positions = campain_positions(id, period)
        keywords.map do |keyword|
          keyword['groups'] = select_groups_for(keyword, groups)
          keyword['positions'] = select_campain_positons_for(keyword, campain_positions)
          Unamo::Keyword.new(keyword)
        end
      end

      private

      def campain_positions(id, period = :one_month)
        date_from = Unamo::TimeCalculator.time_for_period(period)
        date_to = Time.current.strftime("%d/%m/%Y")
        Unamo::Client.campain_positions(id, date_from, date_to)
      end

      def select_groups_for(keyword, groups)
        group_ids = keyword['groups']
        groups.select { |hash| group_ids.include?(hash['id']) }
              .map { |group| group['name'] }
      end

      def select_campain_positons_for(keyword, campain_positions)
        keyword_id = keyword['id']
        campain_p_keywords = campain_positions['keywords']
        campain_p_keywords
          .select { |hash| keyword_id == hash['id'] }
          .map { |campain_positon| campain_positon['positions'] }
          .reduce({}, :merge)
          .compact
      end
    end
  end
end
