require_relative './version'
require_relative './resource_tests/resource_test_group'
require_relative './bundle_tests/post_bundle_test_group'
require_relative './bundle_tests/manual_entry_bundle_test_group'

module EOMTestKit
    class EOMTestSuite < Inferno::TestSuite
        title 'EOM Test Kit'
        description %(
            # Enhancing Oncology Model Inferno Test Kit
            This is an Inferno Test Kit for the Enhancing Oncology Model (EOM) FHIR Implementation Guide. It is designed to test 
            the structure of FHIR resources against the definitions set forth by the IG. 
            
            ## Background
            The Enhancing Oncology Model (EOM) is a Center for Medicare and Medicaid Innovation (CMMI) (Innovation Center) alternative 
            payment model designed to promote high quality, person-centered care, advance health equity, encourage better care coordination, 
            improve access to care, reduce costs, and improve outcomes for Medicare fee-for-service (FFS) beneficiaries with cancer who receive 
            cancer treatment. EOM builds on lessons from the Oncology Care Model (OCM) and shares certain features with OCM, including 
            episode-based payments that financially incentivize physician group practices (PGPs) to improve care and lower costs.
            
            ## Available Tests
            ### EOM Patient Bundle POST Test
            This test allows users to submit an EOM FHIR Bundle resource using an API platform such as Postman 
            via a POST request. The Test Kit will receive the request, then validate the structure of the bundle, as well as the resources
            the bundle contains.
            ### EOM Patient Bundle Manual Input Test
            This test allows users to submit an EOM FHIR Bundle resource directly to the Test Kit. 
            Users will input the bundle either as a JSON string, or will provide a URL to where the JSON is being hosted, if applicable. 
            The kit with then validate the structure of the bundle, as well as the resources the bundle contains.
            ### Individual Resource Test
            This test allows users to submit any EOM FHIR resource directly to the Test Kit, bypassing the 
            bundle process. Users will input their resources either as a JSON string, or will provide a URL to where the JSON is being hosted, 
            if applicable. The kit with then validate the structure of all resources submitted. Only one resource of each type is allowed per run.
        )

        id :eom_test_suite

        VALIDATION_MESSAGE_FILTERS = [
            /\A\S+: \S+: URL value '.*' does not resolve/
        ].freeze

        fhir_resource_validator do
            igs 'igs/package-eom-v0-1-0-may14.tgz'

            cli_context do
                allowExampleUrls true
            end

            exclude_message do |message|
                VALIDATION_MESSAGE_FILTERS.any? { |filter| filter.match? message.message }
            end
        end

        # Example urls generated here
        # localhost root url is: http://localhost:4567/custom/eom
        bundle_ex = File.read(File.join(__dir__, 'sample_resources/patient_bundle.json'))
        bundle_ex_route_handler = proc { [200, { 'Content-Type' => 'application/json' }, [bundle_ex]] }
        route(:get, "/sample_resources/patient_bundle", bundle_ex_route_handler)

        # Receive Manifest via POST set-up
        resume_test_route :post, '/postHere' do |request|
            request.query_parameters["id"]
        end

        links [
            {
                label: 'Report Issue',
                url: 'https://github.com/inferno-framework/eom-test-kit/issues'
            },
            {
                label: 'Open Source',
                url: 'https://github.com/inferno-framework/eom-test-kit'
            },
            {
                label: 'Download',
                url: 'https://github.com/inferno-framework/eom-test-kit/releases'
            },
            {
                label: 'Enhancing Oncology Model IG',
                url: 'https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/index.html'
            }
        ]

        group from: :eom_post_bundle_group
        group from: :eom_manual_entry_bundle_group
        group from: :eom_resource_test_group
    end
end
