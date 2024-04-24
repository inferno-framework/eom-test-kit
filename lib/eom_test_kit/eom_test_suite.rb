require_relative './version'
require_relative './resource_tests/resource_test_group'
require_relative './bundle_tests/post_bundle_test_group'
require_relative './bundle_tests/manual_entry_bundle_test_group'

module EOMTestKit
    class EOMTestSuite < Inferno::TestSuite
        title 'EOM Test Kit'
        description %(
            EOM Test Kit in Development.
        )

        id :eom
        version EOM_VERSION

        validator do
            url ENV.fetch('VALIDATOR_URL', 'http://validator_service:4567')
        end

        # Example urls generated here
        # localhost root url is: http://localhost:4567/custom/eom
        bundle_ex = File.read(File.join(__dir__, '../sample_resources/patient_bundle.json'))
        bundle_ex_route_handler = proc { [200, { 'Content-Type' => 'application/json' }, [bundle_ex]] }
        route(:get, "/sample_resources/patient_bundle", bundle_ex_route_handler)

        # Receive Manifest via POST set-up
        resume_test_route :post, '/postHere' do |request|
            request.query_parameters["id"]
        end

        group from: :eom_post_bundle_group
        group from: :eom_manual_entry_bundle_group
        group from: :eom_resource_test_group
    end
end