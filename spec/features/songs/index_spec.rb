# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Songs Index' do
  describe 'As a Visitor' do
    it 'I see all songs and their title and play count' do
      artist1 = Artist.create!(name: "Britney Spears")
      artist2 = Artist.create!(name: "Haddaway")
      song1 = artist1.songs.create!(title: 'Hit Me Baby One More Time', length: 345, play_count: 10)
      song2 = artist2.songs.create!(title: 'What is Love', length: 543, play_count: 2)

      visit "/songs"

      expect(page).to have_content(song1.title)
      expect(page).to have_content("Play Count: #{song1.play_count}")
      expect(page).to have_content(song2.title)
      expect(page).to have_content("Play Count: #{song2.play_count}")
    end
  end
end
