require_relative './receive_patient_bundle_test'
require_relative './read_posted_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_test'
require_relative '../validation_tests/validate_patient_bundle_contents_test'

module EOMTestKit
    class EOMPostBundleGroup < Inferno::TestGroup
        title 'EOM Patient Bundle POST Test'
        id :eom_post_bundle_group
        description %(
            The tests below validate an [EOM Patient Bundle Resource](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-patient-bundle.html). 
            This receiver will take a provided Patient Bundle via POST request to a given 
            location and validate its contents. This includes validating the structure 
            of the bundle, as well as the structure of the data the bundle contains.

            ### Test Steps
            - **POST the bundle:** When ran, this test will provide the user with an HTTP location for them to send a POST request (via Postman or another API service) 
            containing a FHIR bundle in JSON format. This test will pass if Inferno receives the POST request within three minutes of the test being initiated.
            - **Read the Input from the POST Request:** This test will take the body of the POST request from the previous test and validate whether the provided string 
            is both a valid JSON, and that the JSON is in a known FHIR format.
            - **Validate the Bundle Resource:** This test will take the resource processed in the first step and validate it against the Bundle Structure Definition 
            provided by the EOM IG. If there are any deviations from the Structure Definition, the test will raise a flag and provide details on the discrepancy.
            - **Validate the Bundle Contents:** This test will iterate through the contents of the provided Bundle, validating each resource within against their
            relative Structure Definitions provided by the EOM IG. If there are any deviations from their Structure Definitions, the test will raise a flag and provide 
            details on the discrepancy.
        )

        run_as_group

        test from: :eom_post_patient_bundle_test
        test from: :eom_read_post_test
        test from: :eom_validate_patient_bundle_test
        test from: :eom_validate_patient_bundle_contents_test
    end
end
