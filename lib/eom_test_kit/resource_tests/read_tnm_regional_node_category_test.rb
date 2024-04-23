module EOMTestKit
    class EOMReadTnmRegionalNodeCategoryTest < Inferno::Test
        id :eom_read_tnm_regional_node_category_test
        title 'Receive EOM TNM Regional Node Category'
        description %(
            Test takes from the user either: the http location of category data 
            or the raw JSON of the data itself.
            It attempts to GET the data stored at the given location if a link is provided,
            then validates whether a FHIR resource can be generated from the input data.
        )

        input :node_data,
            title: 'EOM TNM Regional Node Category Data',
            optional: true,
            description: %q(
                User can input the data as: 
                a URL link to the location of the data (ex: http://www.example.com/data.json) 
                OR a JSON string that composes the data. Leaving this blank will skip the test.
            )
        
        def data_scratch
            scratch[:data_resources] ||= {}
        end

        def data_to_test
            data_scratch['TnmRegionalNodeCategory'] ||= []
        end

        run do
            omit_if !node_data.present?, "No data provided; skipping test."

            # if the input is a url, else it is a json
            if node_data.strip[0] != '{'
                assert_valid_http_uri(node_data, "Location provided is not a valid http uri.")
                get node_data
                assert_response_status(200)
                assert_valid_json(request.response_body, "Data received from request is not a valid JSON")
                data = request.response_body
            else
                assert_valid_json(node_data, "JSON inputted was not in a valid format")
                data = node_data
            end
            
            resource = FHIR::Json.from_json(data)
            assert resource.is_a?(FHIR::Model), "Could not generate a valid resource from the input provided"    
            
            if resource.is_a?(FHIR::Model)
                data_to_test << resource
            end
        end
    end
end
