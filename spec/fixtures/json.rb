def json
  @json ||= {
              "region"=>
              {
                "span"=>
                {
                  "latitude_delta"=>0.12593679999999097,
                  "longitude_delta"=>0.2128833299999826
                },
                "center"=>
                {
                  "latitude"=>38.885987,
                  "longitude"=>-77.16956915
                }
              },
              "total"=>39,
              "businesses"=>
              [{
                "is_claimed"=>false,
                "rating"=>3.5,
                "mobile_url"=>"http://business",
                 "review_count"=>70,
                     "name"=>"Business",
                     "location"=>
                      {
                       "city"=>"City",
                       "display_address"=>["6775 Wilson Blvd", "Falls Church, VA 22044"],
                       "address"=>["6775 Wilson Blvd"],
                       "coordinate"=>
                        {
                          "latitude"=>38.872902,
                          "longitude"=>-77.1532816
                        },
                       }
              }]
            }
end