require_relative '../version'

module EOMTestKit
    class ValidatePatientBundleTest < Inferno::Test
        id :eom_validate_patient_bundle_test
        title 'Validate EOM Patient Bundle'
        description %(
            Test takes the Bundle resource submitted to the read test, and validates 
            whether it conforms to its EOM Structure Definition.
        )

        def data_scratch
            scratch[:data_resources] ||= {}
        end

        def data_to_test
            data_scratch['PatientBundle'] ||= []
        end

        run do
            omit_if data_to_test.empty?, "No data of this type was identified."

            profile_definition = 'https://globalalliantinc.com/enhancing-oncology-model/StructureDefinition/eom-patient-bundle'
            profile_with_version = "#{profile_definition}|#{EOM_VERSION}"

            data_to_test.each do |resource|
                assert_resource_type(:bundle, resource: resource)
                assert_valid_resource(resource: resource, profile_url: profile_with_version)
            end
        end
    end
end
