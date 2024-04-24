require_relative './read_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_contents_test'

module EOMTestKit
    class EOMManualEntryBundleGroup < Inferno::TestGroup
        title 'EOM Patient Bundle Manual Entry Test'
        id :eom_manual_entry_bundle_group
        description %(
            The tests below validate an EOM Patient Bundle Resource. 
            This receiver will take a provided Patient Bundle resource, either by url or as 
            a raw json, and validate its contents. This includes validating the structure 
            of the bundle, as well as the structure of the data the bundle contains.
        )

        run_as_group

        test from: :eom_read_patient_bundle_test
        test from: :eom_validate_patient_bundle_test
        test from: :eom_validate_patient_bundle_contents_test
    end
end
