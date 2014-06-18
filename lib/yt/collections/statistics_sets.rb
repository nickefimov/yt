require 'yt/collections/base'
require 'yt/models/statistics_set'

module Yt
  module Collections
    class StatisticsSets < Base

    private

      # @return [Yt::Models::StatisticsSet] a new statistics set initialized 
      #   with one of the items returned by asking YouTube for a list of them.
      def new_item(data)
        Yt::StatisticsSet.new data: data['statistics']
      end

      # @return [Hash] the parameters to submit to YouTube to get the
      #   statistics of a resource, for instance a video.
      # @see https://developers.google.com/youtube/v3/docs/videos#resource
      def list_params
        super.tap do |params|
          params[:params] = {maxResults: 50, part: 'statistics', id: @parent.id}
          params[:path] = "/youtube/v3/#{@parent.kind.pluralize}"
        end
      end
    end
  end
end