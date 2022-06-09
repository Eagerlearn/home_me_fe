class SheltersService
  def self.get_all_shelters
    connection = Faraday.new(url: "https://desolate-caverns-04440.herokuapp.com/api/v1/")
    response = connection.get("shelters")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_save_shelter(shelter_id, user_id)
    data = {data:
              [
                {
                  shelter_id: shelter_id,
                  user_id: user_id
                }
              ]}
    connection = Faraday.new(url: "https://desolate-caverns-04440.herokuapp.com/api/v1/")
    response = connection.post("user_shelters", body = data)
    JSON.parse(response.body, symbolize_names: true)
  end
end
