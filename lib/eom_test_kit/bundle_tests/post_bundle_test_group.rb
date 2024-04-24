require_relative './receive_patient_bundle_test'
require_relative './read_posted_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_contents_test'

module EOMTestKit
    class EOMPostBundleGroup < Inferno::TestGroup
        title 'EOM Patient Bundle POST Test'
        id :eom_post_bundle_group
        description %(
            The tests below validate an EOM Patient Bundle Resource. 
            This receiver will take a provided Patient Bundle via POST request to a given 
            location and validate its contents. This includes validating the structure 
            of the bundle, as well as the structure of the data the bundle contains.
        )

        run_as_group

        test from: :eom_post_patient_bundle_test
        test from: :eom_read_post_test
        test from: :eom_validate_patient_bundle_test
        test from: :eom_validate_patient_bundle_contents_test
    end
end
