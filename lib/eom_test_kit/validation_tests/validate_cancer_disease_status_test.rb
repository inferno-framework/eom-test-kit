require_relative '../version'

module EOMTestKit
    class EOMValidateCancerDiseaseStatusTest < Inferno::Test
        id :eom_validate_cancer_disease_status_test
        title 'Validate EOM Cancer Disease Status'
        description %(
            Test takes the Status resource submitted to the read test, and validates 
            whether it conforms to its EOM Structure Definition.
        )

        def data_scratch
            scratch[:data_resources] ||= {}
        end

        def data_to_test
            data_scratch['CancerDiseaseStatus'] ||= []
        end

        run do
            omit_if data_to_test.empty?, "No data of this type was identified."

            profile_definition = 'https://globalalliantinc.com/enhancing-oncology-model/StructureDefinition/eom-cancer-disease-status'
            profile_with_version = "#{profile_definition}|#{EOM_VERSION}"

            data_to_test.each do |resource|
                assert_valid_resource(resource: resource, profile_url: profile_with_version)
            end
        end
    end
end
