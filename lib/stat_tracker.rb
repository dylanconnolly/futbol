require_relative './game'
require_relative './team'
require_relative './game_team'
require 'CSV'


class StatTracker
  attr_reader :games, :teams, :game_teams

  def self.from_csv(locations)

    games = []
    CSV.foreach(locations[:games], headers: true, header_converters: :symbol) do |row|
      games << Game.new(row)
    end

    teams = []
    CSV.foreach(locations[:teams], headers: true, header_converters: :symbol) do |row|
      teams << Team.new(row)
    end

    game_teams = []
    CSV.foreach(locations[:game_teams], headers: true, header_converters: :symbol) do |row|
      game_teams << GameTeam.new(row)
    end


    StatTracker.new(games, teams, game_teams)
  end

  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end
end