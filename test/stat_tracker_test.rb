require './test/test_helper'
require './lib/game'
require 'CSV'

class StatTrackerTest < Minitest::Test
  def setup
    # using top 20 rows in each csv
    game_path = './data/dummy_games.csv'
    team_path = './data/dummy_teams.csv'
    game_teams_path = './data/dummy_game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_initializes
    assert_equal 20, @stat_tracker.teams.count
    assert_equal 20, @stat_tracker.games.count
    assert_equal 20, @stat_tracker.game_teams.count
  end

  def test_it_can_find_highest_and_lowest_scoring_game_and_biggest_blowout
    assert_equal 5, @stat_tracker.highest_total_score
    assert_equal 1, @stat_tracker.lowest_total_score
    assert_equal 3, @stat_tracker.biggest_blowout
  end

  def test_percentage_of_home_wins
    assert_equal 70.00, @stat_tracker.percentage_home_wins
  end

  def test_percentage_of_visitor_wins
    assert_equal 25.00, @stat_tracker.percentage_visitor_wins
  end

  def test_percentage_of_tie_games
    assert_equal 5.00, @stat_tracker.percentage_tie_games
  end

  # def test_count_of_games_by_season
  #
  #   assert_equal ["20122013" => "20"], @stat_tracker.game_count_by_season(season)
  # end

  def test_average_goals_per_game
    assert_equal 3.75, @stat_tracker.average_goals_per_game
  end

  def test_averaage_number_of_goals_scored_per_season
    assert_equal 3.75, @stat_tracker.average_goals_per_season
  end
end
