require 'net/http'
require 'json'

class MoviesController < ApplicationController

  def index
    uri = URI(ENV['TMDB_API_URL'] + '/movie/top_rated?language=en-US&page=' + params[:page])
    request = Net::HTTP::Get.new uri
    request['Authorization'] = 'Bearer ' + ENV['TMDB_API_TOKEN']
    request['accept'] = 'application/json'

    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      response = http.request request
      render json: response.body
    end
  end

  def show
    movies = nil

    uri = URI(ENV['TMDB_API_URL'] + '/movie/' + params[:id])
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri
      request['Authorization'] = 'Bearer ' + ENV['TMDB_API_TOKEN']
      request['accept'] = 'application/json'
      movies = http.request(request).body
    end

    render json: movies
  end

  def potential_watchers
      users = User.all
      movie = nil
      matching_users = []

      uri = URI(ENV['TMDB_API_URL'] + '/movie/' + params[:id])
      request = Net::HTTP::Get.new uri
      request['Authorization'] = 'Bearer ' + ENV['TMDB_API_TOKEN']
      request['accept'] = 'application/json'

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        response = http.request request
        movie = JSON.parse(response.body)
      end

      puts movie

      genre_ids = movie['genres'].map do |genre|
        genre['id']
      end

      users.each do |user|
        p user.id
        if user.genders_id.include?(genre_ids[0].to_s) || user.genders_id.include?(genre_ids[1].to_s)
          matching_users.push(user)
        end
      end

      render json: matching_users
  end
end
