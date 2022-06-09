class ResultsController < ApplicationController
  def index
    @shelters = SheltersFacade.all_shelters

    @found_shelters = @shelters.find_all do |shelter|
      (shelter.name.include?(params[:name]) && params[:name] != "") || (shelter.zipcode.include?(params[:zipcode]) && params[:zipcode] != "") || (shelter.address.include?(params[:address]) && params[:address] != "")
    end
  end

  def all_shelters
    @shelters = SheltersFacade.all_shelters
  end

  def save
    @save_shelter = SheltersFacade.save_shelter(params[:shelter_id], params[:user_id])
  end

  def show
    @shelter_name = params[:name].split("-").join(" ")
    @shelters = SheltersFacade.all_shelters
    @shelter = @shelters.find { |shelter| shelter.name.downcase == @shelter_name }
  end
end
