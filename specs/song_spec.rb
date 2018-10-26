require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < Minitest::Test

  def test_song_has_name
    song1 = Song.new("Mala vida")
    assert_equal("Mala vida", song1.title)
  end

end
