module EOMTestKit
    class ReadPostTest < Inferno::Test
        id :eom_read_post_test
        title 'Read Input from POST Request'
        description %(
            Test takes the file POSTed in the previous test,
            and validates whether a FHIR resource can be generated from the input data.
        )
        
        uses_request :patient_bundle

        def bundle_scratch
            scratch[:data_resources] ||= {}
        end

        def bundle_resources
            bundle_scratch['PatientBundle'] ||= []
        end

        run do
            found_resource = FHIR::Json.from_json(request.request_body)
            assert found_resource.is_a?(FHIR::Model), "Could not generate a valid resource from the input provided"    
            
            if found_resource.is_a?(FHIR::Model)
                bundle_resources << found_resource
            end
        end
    end
end
