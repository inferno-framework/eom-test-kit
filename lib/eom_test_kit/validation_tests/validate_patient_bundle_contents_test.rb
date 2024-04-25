require_relative '../version'

module EOMTestKit
    class ValidatePatientBundleContentsTest < Inferno::Test
        id :eom_validate_patient_bundle_contents_test
        title 'Validate EOM Patient Bundle Contents'
        description %(
            Test takes the Bundle resource submitted to the read test, and validates 
            each resource within the bundle, confirming whether they conform to 
            their EOM Structure Definitions.
        )

        def data_scratch
            scratch[:data_resources] ||= {}
        end

        def data_to_test
            data_scratch['PatientBundle'] ||= []
        end

        run do
            omit_if data_to_test.empty?, "No data of this type was identified."

            data_to_test.each do |resource|
                assert_resource_type(:bundle, resource: resource)
                assert_valid_bundle_entries(bundle: resource, resource_types: {})
            end
        end
    end
end
