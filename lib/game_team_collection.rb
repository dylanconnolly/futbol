require 'CSV'
require_relative './game_team_collection'

class GameTeamCollection
  attr_reader :game_teams

  def self.load_data(path)
    game_teams = {}
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      game_teams[row[:game_id]] = []
      require "pry"; binding.pry

      game_teams[row[:game_id]] << GameTeam.new(row)
    end

    GameTeamCollection.new(game_teams)
  end

  def initialize(game_teams)
    @game_teams = game_teams
  end
end
