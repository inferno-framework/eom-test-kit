require_relative './read_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_contents_test'

module EOMTestKit
    class EOMManualEntryBundleGroup < Inferno::TestGroup
        title 'EOM Patient Bundle Manual Entry Test'
        id :eom_manual_entry_bundle_group
        description %(
            The tests below validate [EOM Patient Bundle Resource](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-patient-bundle.html). 
            This receiver will take a provided Patient Bundle resource, either by url or as 
            a raw JSON, and validate its contents. This includes validating the structure 
            of the bundle, as well as the structure of the data the bundle contains.

            ### Test Steps
            - **Receive the Bundle Resource:** This test will take the inputted bundle, either as a JSON string, or a URL that points to the location
            the bundle is being stored. It will then GET the bundle if a URL is provided, and validate whether the provided string is both a valid JSON, 
            and that the JSON is in a known FHIR format.
            - **Validate the Bundle Resource:** This test will take the resource processed in the first step and validate it against the Bundle Structure Definition 
            provided by the EOM IG. If there are any deviations from the Structure Definition, the test will raise a flag and provide details on the discrepancy.
            - **Validate the Bundle Contents:** This test will iterate through the contents of the provided Bundle, validating each resource within against their
            relative Structure Definitions provided by the EOM IG. If there are any deviations from their Structure Definitions, the test will raise a flag and provide 
            details on the discrepancy.
        )

        run_as_group

        test from: :eom_read_patient_bundle_test
        test from: :eom_validate_patient_bundle_test
        test from: :eom_validate_patient_bundle_contents_test
    end
end
